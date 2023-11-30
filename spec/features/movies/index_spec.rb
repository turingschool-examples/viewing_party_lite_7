require 'rails_helper'

RSpec.describe 'discover movies' do
  before (:each) do
    @user1 = User.create!(name: 'Brendan', email: 'brendan@turing.edu')
    @user2 = User.create!(name: 'Paul', email: 'paul@turing.edu')
    @user3 = User.create!(name: 'Sooyung', email: 'sooyung@turing.edu')
  end

  it 'shows the top rated movies and their average rating' do
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
        expect(page).to have_content(movie[:vote_average])
      end
    end


  it 'shows what you search for' do

  end
end