# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe 'User Show Page' do
  describe 'As an authenticated user', :vcr do
    before :each do
      @user = User.create!(name: 'Weston', email: 'IMaG@thehood.com')
      @movie_details = MovieFacade.movie_details(100)
      @movie = Movie.create(
        id: @movie_details.id,
        title: @movie_details.title,
        vote_average: @movie_details.vote_average,
        runtime: @movie_details.runtime,
        genres: @movie_details.genres,
        description: @movie_details.description,
        poster_path: @movie_details.poster_path
      )

      @viewing_parties = ViewingParty.create!(movie_id: @movie.id, user_id: @user.id,
                                              date_time: '2021-08-01 01:00:00', is_host: true)
      @party = @user.viewing_parties.create(movie_id: 100, date_time: '2021-08-01 01:00:00')
      @guest = User.create!(name: 'Guest', email: 'guest@gmail.com')
      ViewingParty.create!(movie_id: @movie.id, user_id: @guest.id, date_time: '2021-08-01 01:00:00', is_host: false)
      visit user_path(@user)
    end

    it 'displays a button to disover movies' do
      expect(page).to have_button('Discover Movies')

      click_button 'Discover Movies'

      expect(current_path).to eq(discover_user_path(@user))
    end

    it 'displays user dashboard details' do
      visit user_path(@user.id)

      expect(page).to have_content("#{@user.name}'s Dashboard")
      expect(page).to have_content('Viewing Parties')
      expect(page).to have_content(@movie.title)
    end

    it 'I see a list of all my viewing parties' do
      expect(page).to have_content('Viewing Parties')
      expect(page).to have_content(@movie.title)
      expect(page).to have_content(@party.date_time.strftime('%B %d, %Y %I:%M %p'))
    end

    it 'displays the movie image, description, host indication, and party date time' do
      expect(page).to have_css("img[src*='#{@movie.poster_path}']")
      expect(page).to have_content(@movie.description)
      expect(page).to have_content('Hosting')
      expect(page).to have_content(@party.date_time.strftime('%B %d, %Y %I:%M %p'))
    end

    describe 'when the user is the host' do
      it 'displays the list of invited friends' do
        expect(page).to have_content('Invited Friends')
        expect(page).to have_content(@guest.name)
      end
    end

    describe 'when the user is not the host' do
      it 'displays the list of invited users with host name in bold' do
        visit user_path(@guest.id)

        expect(page).to have_content('Invited Users')
        expect(page).to have_content(@user.name)
        expect(page).to have_content(@guest.name)
      end
    end
  end
end
