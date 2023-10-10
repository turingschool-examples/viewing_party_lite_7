require "rails_helper"

RSpec.describe "Register", type: :feature do
  before :each do
    @user_1 = User.create!(name: "Jamie", email: "34@gmail.com")
    @user_2 = User.create!(name: "Katie", email: "34997@gmail.com")

    visit "/"
  end

  feature "As a user" do
    feature "When I click the add a new user button" do
      scenario "I'm routed to '/register' path and see a form to register" do
        expect(page).to have_button("Create a New User")
        click_button "Create a New User"

        expect(current_path).to eq("/register")

        expect(page).to have_content("Name")
        expect(page).to have_content("Email (must be unique)")
        expect(page).to have_button("Register")

        fill_in "Name", with: "#{user_1.name}"
        fill_in "Email", with: "#{user_1.email}"
        click_button "Register"

        expect(curent_path).to eq("/users/#{user_1.id}")
      end
    end
  end
end