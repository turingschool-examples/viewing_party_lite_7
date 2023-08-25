require 'rails_helper'

RSpec.describe 'movie results page', type: :feature do
  describe 'I click either button and see api data' do
    scenario "it displays title as a link and vote average" do
      VCR.use_cassette("it displays title as a link and vote average") do 
      json_response = File.read('spec/fixtures/movie_results.json')
      stub_request(:get, "https://api.themoviedb.org/3/discover/movie.json").
      to_return(status: 200, body: json_response)
      
      data = JSON.parse(json_response, symbolize_names: true)

      movies = data[:results]
      u1 = User.create!(name: "Sean", email: "champion4lyfe@gmail.com")

      visit user_movies_path(u1)
      expect(page).to have_link(movies[0][:title])

      click_link("#{movies[0][:title]}")

      expect(current_path).to eq(user_movie_path(u1, movies[0][:id]))
      end
    end
  end
end