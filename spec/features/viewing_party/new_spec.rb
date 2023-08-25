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
        user = create(:user)
        movie_id = 238
        visit "/users/#{user.id}/movies/#{movie_id}/viewing_party/new"

        expect(page).to have_content("The Godfather")
        expect(page).to have_css("new_viewing_party_form")
        expect(page).to have_field("duration")
        expect(page).to have_field("date")
        expect(page).to have_field("start_time")
        expect(page).to have_field(user.name)
        expect(page).to have_button("Create a Party")
      end
    end
  end
end