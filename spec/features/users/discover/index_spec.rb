require "rails_helper"

RSpec.describe "User Discover", type: :feature do
  before :each do
    @user_1 = User.create!(name: "Jamie", email: "34@gmail.com")
  end

  feature "As a user" do
    feature "When I go to a user dashboard and click the 'Discover Movies' button" do
      scenario "it redirects to a discover page, where :id is the user_id of the user whose dashboard I was just on" do
        visit "/users/#{@user_1.id}"

        click_button "Discover Movies"

        expect(current_path).to eq("/users/#{@user_1.id}/discover")

        expect(page).to have_content("Discover Movies")
      end
    end
  end
end