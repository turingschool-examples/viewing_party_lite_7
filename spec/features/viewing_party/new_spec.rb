require "rails_helper"

describe "New Viewing Party Page" do
# When I visit the new viewing party page (/users/:user_id/movies/:movid_id/viewing-party/new, where :user_id is a valid user's id),
# I should see the name of the movie title rendered above a form 
# with the following fields:
#  Duration of Party with a default value of movie runtime in minutes; 
# a viewing party should NOT be created if set to a value less than the duration of the movie
#  When: field to select date
#  Start Time: field to select time
#  Checkboxes next to each existing user in the system
#  Button to create a party
# Details: When the party is created, the user should be redirected 
# back to the dashboard where the new event is shown. 
# The event should also be listed on any other user's dashbaords 
# that were also invited to the party.

  describe "When I visit the new viewing party page (/users/:user_id/movies/:movid_id/viewing-party/new, where :user_id is a valid user's id)" do
    it "I should see the name of the movie title rendered above a form 
      with the following fields:
      Duration of Party with a default value of movie runtime in minutes; 
      a viewing party should NOT be created if set to a value less than the duration of the movie
      When: field to select date
      Start Time: field to select time
      Checkboxes next to each existing user in the system
      Button to create a party" do

      VCR.use_cassette('themoviedb_viewing_party_5') do
        user = create_list(:user,4)
        movie_id = 238
        visit "/users/#{user[0].id}/movies/#{movie_id}/viewing_party/new"

        expect(page).to have_content("The Godfather")
        expect(page).to have_css("#new_viewing_party_form")
        expect(page).to have_field("duration_of_party")
        expect(page).to have_field("date")
        expect(page).to have_field("start_time")
        expect(page).to have_field(user[0].name)
        expect(page).to have_button("Create a Party")
      end
    end

    it "When the party is created, the user should be redirected back to the dashboard where the new event is shown. The event should also be listed on any other user's dashbaords that were also invited to the party." do
      VCR.use_cassette('themoviedb_viewing_party_6') do
        user = create_list(:user,4)
        movie_id = 238
        visit "/users/#{user[0].id}/movies/#{movie_id}/viewing_party/new"
        fill_in "duration_of_party", with: "300"
        fill_in "date", with: "8-30-23"
        fill_in "start_time", with: "3:00pm"
        check "#{user[1].name}"
        click_button "Create a Party"
        
        expect(current_path).to eq("/users/#{user[0].id}")
        within "#viewing_parties" do
          expect(page).to have_css(".movie_thumbnail")
          expect(page).to have_content("The Godfather")
          expect(page).to have_content("8-30-23")
          expect(page).to have_content("3:00pm")
          expect(page).to have_content("Hosting")
        end
        
        visit "/users/#{user[1].id}"
        within "#viewing_parties" do
          expect(page).to have_css(".movie_thumbnail")
          expect(page).to have_content("The Godfather")
          expect(page).to have_content("8-30-23")
          expect(page).to have_content("3:00pm")
          expect(page).to have_content("Invited")
        end
        
      end
    end
  end
end