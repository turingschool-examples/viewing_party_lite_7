# frozen_string_literal: true
require 'rails_helper'

RSpec.describe '#show', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Brendan', email: 'brendan@turing.edu')
    @user2 = User.create!(name: 'Paul', email: 'paul@turing.edu')
    @user3 = User.create!(name: 'Sooyung', email: 'sooyung@turing.edu')
  end
  it 'shows the name of the user next to dashboard' do
    visit user_path(@user1.id)
    expect(page).to have_content("#{@user1.name}'s Dashboard")
  end
  it 'has a discover movies button' do
    visit user_path(@user2.id)
    expect(page).to have_button('Discover Movies')
  end
  it 'has a viewing party list' do
    visit user_path(@user3.id)
    expect(page).to have_content("Viewing Parties")
  end
  describe 'clicking discover movies' do
    it 'takes you to the discover page' do
      visit user_path(@user1.id)
      click_button 'Discover Movies'
      expect(current_path).to eq(discover_user_path(@user1.id))
    end
  end

  describe 'when I visit /users/:user_id/discover' do
    it 'has a home link and discover movies title' do
      visit discover_user_path(@user1)
      expect(page).to have_link('Home')
      expect(page).to have_content('Discover Movies')
    end

    it 'has a discover movies title and a button to top rated movies' do
      json_response = File.read("spec/fixtures/top_rated.json")
      parsed = JSON.parse(json_response, symbolize_names: true)
      movies = parsed[:results]
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{Rails.application.credentials.tmdb[:key]}").
        with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Faraday v2.7.12'
          }).
        to_return(status: 200, body: json_response, headers: {})
      visit discover_user_path(@user1)
      expect(page).to have_button('Find Top Rated Movies')
      click_button('Find Top Rated Movies')
      expect(current_path).to eq(user_movies_path(@user1))
      movies.each do |movie|
        expect(movie[:title]).to be_a(String)
        expect(page).to have_content(movie[:title])
      end
    end

    it 'has a text field to search movie by title' do
      visit discover_user_path(@user1)
      expect(page).to have_field('search')
    end

    it 'has a button to find movie' do
      visit discover_user_path(@user1)
      expect(page).to have_button('Find Movies')
    end
  end

  describe 'When I visit the users show page' do
    before(:each) do
      @user_1 = User.create!(name: 'Kiwi', email: 'kiwibird@gmail.com')
      @user_2 = User.create!(name: 'Pam', email: 'pam@email.com')
      @party_1 = Party.create!(movie_id: 438631, duration_of_party: 109, party_date: '2024-12-01', start_time: '07:23')
      @party_2 = Party.create!(movie_id: 438631, duration_of_party: 109, party_date: '2024-12-01', start_time: '09:23')
      @party_3 = Party.create!(movie_id: 438631, duration_of_party: 109, party_date: '2024-12-01', start_time: '13:09')
      @party_4 = Party.create!(movie_id: 438631, duration_of_party: 109, party_date: '2024-12-01', start_time: '15:09')
      PartyUser.create!(user_id: @user_1.id, party_id: @party_1.id, is_host: true)
      PartyUser.create!(user_id: @user_2.id, party_id: @party_1.id, is_host: false)
      PartyUser.create!(user_id: @user_1.id, party_id: @party_2.id, is_host: false)
      PartyUser.create!(user_id: @user_2.id, party_id: @party_2.id, is_host: true)
      PartyUser.create!(user_id: @user_1.id, party_id: @party_3.id, is_host: false)
      PartyUser.create!(user_id: @user_2.id, party_id: @party_3.id, is_host: true)
      visit "/users/#{@user_1.id}"
    end

    
    context 'displaying viewing parties', :vcr do
      it 'has a section for viewing parties' do
        expect(page).to have_css('#hosted-parties')
      end
      
      it 'displays cards for each viewing party the user has created' do
        within("#party-#{@party_1.id}") do
          page.has_css?("img[src*='themoviedb']")
          expect(page).to have_content('Dune')
          expect(page).to have_content('Dec 01, 2024')
          expect(page).to have_content('07:23 AM')
          expect(page).to have_content("Host: #{@user_1.name}")
          expect(page).to have_content("Guest List: #{@user_2.name}")
        end
      end

      it 'displays cards for each viewing party the user has been invited to' do
        within("#party-#{@party_2.id}") do
          page.has_css?("img[src*='themoviedb']")
          expect(page).to have_content('Dune')
          expect(page).to have_content('09:23 AM')
          expect(page).to have_content("Guest List: #{@user_1.name}")
        end

        within("#party-#{@party_3.id}") do
          page.has_css?("img[src*='themoviedb']")
          expect(page).to have_content('Dune')
          expect(page).to have_content('01:09 PM')
          expect(page).to have_content("Guest List: #{@user_1.name}")
        end
      end
    end
  end
end
