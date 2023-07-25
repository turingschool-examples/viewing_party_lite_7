require "rails_helper"

RSpec.describe "User Registration form" do
  it "happy path creates a new user" do
    visit "/register"

    expect(page).to have_content("Register a New User")
    expect(page).to have_field("User name")
    expect(page).to have_field("Email")
    expect(page).to have_field("Password")
    expect(page).to have_field("Password Confirmation")
    expect(page).to have_button("Create New User")

    fill_in "User name", with: "Steve Test"
    fill_in "Email", with: "Steve@test.com"
    fill_in "Password:", with: "test"
    fill_in "Password Confirmation:", with: "test"

    click_button "Create New User"

    expect(current_path).to eq(dashboard_path)
  end

  it "sad path/ can't create a new user because the passwords don't match" do
    visit "/register"

    fill_in "User name", with: "Steve Test"
    fill_in "Email", with: "Steve@test.com"
    fill_in "Password:", with: "test"
    fill_in "Password Confirmation:", with: "Test"

    click_button "Create New User"

    expect(current_path).to eq("/register")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end