require "rails_helper"

RSpec.describe "user registration page" do
  before(:each) do
    @user1 = User.create!(name: "Flick Chick", email: "flick@yahoo.com")
    @user2 = User.create!(name: "Rom Com Ron", email: "comron@yahoo.com")
    @user3 = User.create!(name: "Action Jackson", email: "itsjack@aol.com")
  end
  it "should contain a user registration form" do
    #user story
    #   When a user visits the '/register' path they should see a form to register.

    # The form should include:

    # Name
    # Email (must be unique)
    # Register Button
    # Once the user registers they should be taken to a dashboard page '/users/:id', where :id is the id for the user that was just created.
    visit "/register"

    expect(page).to have_field("Name")
    fill_in "Name", with: "PopCorn"
    expect(page).to have_field("Email")
    fill_in "Email", with: "popcornfool@gmail.com"

    expect(page).to have_button("Register")
    click_button "Register"
    expect(current_path).to eq(user_path(User.last))
  end
end