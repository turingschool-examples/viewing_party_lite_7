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

        u1 = User.create!(name: "Sean", email: "sugasean777@gmail.com")
        visit new_user_movie_viewing_party_path(u1, "569094")
        
        expect(page).to have_content("Spider-Man: Across the Spider-Verse")
      end
    end

    scenario 'I should see a form with fields' do
      VCR.use_cassette("I should see a form with fields") do 
        json_response = File.read('spec/fixtures/movie_results.json')
        stub_request(:get, "https://api.themoviedb.org/3/discover/movie.json").
        to_return(status: 200, body: json_response)
          
        data = JSON.parse(json_response, symbolize_names: true)
    
        movies = data[:results]
  
        u1 = User.create!(name: "Sean", email: "sugasean777@gmail.com")
        u2 = User.create!(name: "Bob", email: "bobby@yahoo.com")
        visit new_user_movie_viewing_party_path(u1, "569094")

        expect(page).to have_field(:duration)
        expect(page).to have_field(:date)
        expect(page).to have_field(:start_time)
        expect(page).to have_button("Create Party")

        fill_in :duration, with: 117
        fill_in :date, with: "2024-9-25"
        fill_in :start_time, with: "12:00 PM"
        check("Bob")
        
        click_button "Create Party"
        expect(current_path).to eq(user_movie_viewing_parties_path(u1, "569094"))
      end
    end
  end
end