require 'rails_helper'

RSpec.describe 'New Viewing Party Page', vcr: { record: :new_episodes } do
  describe 'Create a new viewing party' do
    before do
      @user1 = User.create!(email: 'jon@jon.com', name: 'Jon', password: 'password')
      @user2 = User.create!(email: 'bob@bob.com', name: 'Bob', password: '123test')
      @user3 = User.create!(email: 'sally@sally.com', name: 'Sally', password: 'test456')
      @movie = MovieService.new.top_rated_movies.first
      @movie_details = MovieService.new.full_movie_details(@movie[:id])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    end
    it 'I can create a new viewing party' do
      # require 'pry'; binding.pry
      visit "/dashboard/movies/#{@movie[:id]}/viewing_parties/new"
      save_and_open_page
      expect(page).to have_content('Viewing Party')
      expect(page).to have_link('Home')
      expect(page).to have_link('Discover Movies')
      expect(page).to have_content('Movie Title')
      expect(page).to have_content(@movie[:title])
      expect(page).to have_content('Duration')
      expect(page).to have_content(@movie[:runtime])
      expect(page).to have_content('Date')
      expect(page).to have_field('date')
      expect(page).to have_content('Time')
      expect(page).to have_field('start_time')
      expect(page).to have_field("user_ids[#{@user1.id}]")
      expect(page).to have_content('Invite Other Users')
      expect(page).to have_button('Create Party')
      expect(page).to have_content(@user1.email)
      expect(page).to have_content(@user2.email)
      expect(page).to have_content(@user3.email)
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user3.name)
    end

    it 'I can create a new viewing party' do
      # user = User.create!(email: 'jon@jon.com', name: 'Jon', password: 'password')
      # user2 = User.create!(email: 'bob@bob.com', name: 'Bob', password: '123test')
      # movie = MovieService.new.top_rated_movies.first
      # movie_details = MovieService.new.full_movie_details(movie[:id])
# require 'pry'; binding.pry
      visit "/dashboard/movies/#{@movie[:id]}/viewing_parties/new"
      # visit dashboard_movies_path(movie[:id])

      fill_in :date, with: '2023-08-01'
      fill_in :start_time, with: '12:00'
      fill_in :duration, with: @movie[:runtime]
      check "user_ids[#{@user2.id}]"
      
      click_on 'Create Party'

      expect(current_path).to eq(user_dashboard_path(user))
    end
  end
end
