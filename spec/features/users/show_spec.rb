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
end
