require 'rails_helper'

RSpec.describe "user dashboard page", type: :feature do
  describe "display" do
    before do
      test_data
    end

    it "has user's name, a discover button, and a party viewing section" do
      visit "/users/#{@user_1.id}"

      expect(page).to have_content("User 1's Dashboard")
      expect(page).to have_button("Discover Movies")
      within("#parties") do
        expect(page).to have_content("This user has no parties yet")
      end

      click_button("Discover Movies")
      expect(current_path).to eq("/users/#{@user_1.id}/discover")
    end

    it "lists viewing parties that I am invited to with VP info", :vcr do
      visit "/users/#{@user_3.id}"

      within("#hosted-vps") do
        expect(page).to have_content("Fight Club")
        expect(page).to have_content(@party_2.format_date)
        expect(page).to have_content(@party_2.format_time)
        expect(page).to have_content("Hosting")
        expect(page).to have_content("#{@user_4.name}")
        expect(page).to have_content("#{@user_5.name}")
      end

      within("#guest-vps") do
        expect(page).to have_content(@party_1.format_date)
        expect(page).to have_content(@party_1.format_time)
        expect(page).to have_content("Invited")
        expect(page).to have_content("Hosted by: #{@user_4.name}")
        expect(page).to have_content("#{@user_2.name}")
        expect(page).to have_content("#{@user_3.name}")
      end
    end

    it "has movie titles linked to their show page", :vcr do
      visit "/users/#{@user_3.id}"

      click_link "Fight Club"
      expect(current_path).to eq(user_movie_path(@user_3.id, 550))
    end
  end
end


# As a user,
# When I visit a user dashboard,
# I should see the viewing parties that the user has been invited to with the following details:

#  Movie Image
#  Movie Title, which links to the movie show page
#  Date and Time of Event
#  who is hosting the event
#  list of users invited, with my name in bold

# I should also see the viewing parties that the user has created with the following details:

#  Movie Image
#  Movie Title, which links to the movie show page
#  Date and Time of Event
#  That I am the host of the party
#  List of friends invited to the viewing party