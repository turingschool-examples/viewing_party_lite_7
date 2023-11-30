require 'rails_helper'

RSpec.describe  do
  before(:each) do
    @user1 = User.create!(name: 'Brendan', email: 'brendan@turing.edu')
    @user2 = User.create!(name: 'Paul', email: 'paul@turing.edu')
    @user3 = User.create!(name: 'Sooyung', email: 'sooyung@turing.edu')
  end

  describe 'when I visit /users/:user_id/movies/:movies_id/viewing-party/new' do
    it 'shows the title of the movie' do

      json_response = File.read("spec/fixtures/top_rated.json")
      # parsed = JSON.parse(json_response, symbolize_names: true)
      # movies = parsed[:results]
      stub_request(:get, "https://api.themoviedb.org/3/movie/?api_key=#{Rails.application.credentials.tmdb[:key]}").
        with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Faraday v2.7.12'
          }).
        to_return(status: 200, body: json_response, headers: {})

      visit "/users/#{@user1.id}/movies/:movies_id/viewing-party/new"
      expect().to eq()
    end
  end
end
