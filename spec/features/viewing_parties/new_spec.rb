require 'rails_helper'
# When I visit the new viewing party page (/users/:user_id/movies/:movid_id/viewing-party/new, where :user_id is a valid user's id),
# I should see the name of the movie title rendered above a form with the following fields:

#  Duration of Party with a default value of movie runtime in minutes; a viewing party should NOT be created if set to a value less than the duration of the movie
#  When: field to select date
#  Start Time: field to select time
#  Checkboxes next to each existing user in the system
#  Button to create a party

# Details When the party is created, the user should be redirected 
# back to the dashboard where the new event is shown. The event should also be listed on any other user's dashbaords that were also invited to the party.
RSpec.describe 'New Viewing Party', type: :feature do
  describe 'When I visit the new viewing party page' do
    scenario 'I should see the name of the movie title rendered above a form' do 
      VCR.use_cassette("I should see the name of the movie title rendered above a form") do 
        json_response = File.read('spec/fixtures/movie_results.json')
        stub_request(:get, "https://api.themoviedb.org/3/discover/movie.json").
        to_return(status: 200, body: json_response)
        
        data = JSON.parse(json_response, symbolize_names: true)
  
        movies = data[:results]
        u1 = User.create!(name: "Sean", email: "champion4lyfe@gmail.com")
    

        u1 = User.create!(name: "Sean", email: "sugasean777@gmail.com")
        visit new_user_movie_viewing_party_path(u1, "569094")

        expect(page).to have_content("Spider-Man: Across the Spider-Verse")
      end
    end
  end
end