require "rails_helper"
# When I visit a movie's detail page (/users/:user_id/movies/:movie_id where :id is a valid user id,
# I should see

#  Button to create a viewing party
#  Button to return to the Discover Page
# Details This viewing party button should take the user to the new viewing party page (/users/:user_id/movies/:movie_id/viewing-party/new)

# And I should see the following information about the movie:

#  Movie Title
#  Vote Average of the movie
#  Runtime in hours & minutes
#  Genre(s) associated to movie
#  Summary description
#  List the first 10 cast members (characters&actress/actors)
#  Count of total reviews
#  Each review's author and information
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

        expect(page).to have_button("Create Viewing Party")

        click_button "Create Viewing Party"
        expect(current_path).to eq(new_user_movie_viewing_party_path(u1, movies[0][:id]))
      end
    end

    scenario "displays a button to return to the discover page" do
      VCR.use_cassette("displays a button to return to the discover page") do
        json_response = File.read('spec/fixtures/movie_results.json')
        stub_request(:get, "https://api.themoviedb.org/3/discover/movie.json").
        to_return(status: 200, body: json_response)
        
        data = JSON.parse(json_response, symbolize_names: true)

        movies = data[:results]
        u1 = User.create!(name: "Sean", email: "sean@bean.com")

        visit user_movie_path(u1, movies[0][:id])

        expect(page).to have_button("Discover Page")
        click_button "Discover Page"
        expect(current_path).to eq(user_discover_index_path(u1))

        visit user_movie_path(u1, movies[0][:id])

        expect(page).to have_content("Title: #{movies[0][:title]}")
        expect(page).to have_content("Vote Average: #{movies[0][:vote_average]}")
        expect(page).to have_content("Overview: #{movies[0][:overview]}")
      end
    end

    scenario "displays character, actor/actress" do 
      VCR.use_cassette("displays character, actor/actress") do
        u1 = User.create!(name: "Sean", email: "sean@bean.com")

        json_response = File.read('spec/fixtures/credits.json')

      stub_request(:get, "https://api.themoviedb.org/3/movie/346698/credits.json").
      to_return(status: 200, body: json_response)
      
      data = JSON.parse(json_response, symbolize_names: true)

      cast = data[:cast].take(10)

      visit user_movie_path(u1, "346698")

        cast.each do |c|
          expect(page).to have_content("#{c[:name]}")
          expect(page).to have_content("#{c[:character]}")
        end  
      end
    end

    scenario "displays reviews" do
      VCR.use_cassette("displays reviews") do
        u1 = User.create!(name: "Sean", email: "sean@bean.com")

        json_response = File.read('spec/fixtures/reviews.json')

      stub_request(:get, "https://api.themoviedb.org/3/movie/346698/reviews").
      to_return(status: 200, body: json_response)
      
      data = JSON.parse(json_response, symbolize_names: true)

      reviews = data[:results].take(10)
      total_reviews = data[:total_results]

      visit user_movie_path(u1, "346698")
      
      expect(page).to have_content("Total Reviews: #{total_reviews}")

        save_and_open_page
          #within("reviews") do
            reviews.each do |r|
              expect(page).to have_content("#{r[:author]}")
              #expect(page).to have_content("#{r[:content]}")
            end  
          #end

      end
    end

    scenario "displays runtime and genres" do
      VCR.use_cassette("displays runtime and genres") do
        u1 = User.create!(name: "Sean", email: "sean@bean.com")

        json_response = File.read('spec/fixtures/details.json')

        stub_request(:get, "https://api.themoviedb.org/3/movie/346698").
        to_return(status: 200, body: json_response)
        
        data = JSON.parse(json_response, symbolize_names: true)

        genres = data[:genres]
        runtime = data[:runtime] / 60
        runtime_minutes = data[:runtime] % 60

        visit user_movie_path(u1, "346698")

        genres.each do |g|
          expect(page).to have_content("#{g[:name]}")
        end
        expect(page).to have_content("Runtime: #{runtime} hour(s) & #{runtime_minutes} minutes")
      end
    end
  end
end
