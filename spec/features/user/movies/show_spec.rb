require "rails_helper"

RSpec.describe 'movie details page', type: :feature do
  describe "when i go to the name of the viewing party" do
    scenario "displays a button to create a viewing party" do
      VCR.use_cassette("displays a button to create a viewing party") do
        json_response = File.read('spec/fixtures/movie_results.json')
        stub_request(:get, "https://api.themoviedb.org/3/discover/movie.json").
        to_return(status: 200, body: json_response)
        
        data = JSON.parse(json_response, symbolize_names: true)

        movies = data[:results]
        u1 = User.create!(name: "Sean", email: "sean@bean.com")
        
        visit user_movie_path(u1, movies[0][:id])
        save_and_open_page
        expect(page).to have_button("Create Viewing Party")

        click_button "Create Viewing Party"
        expect(current_path).to eq(new_user_movie_viewing_party_path(u1, movies[0][:id]))
        
        end
      end
    end
  end
