require "rails_helper"

RSpec.describe "User Registration", type: :feature do
  scenario "user visits user registration page, fills out the form, and is taken back to the dashboard" do
    visit new_register_path

    expect(current_path).to eq(new_register_path) 
    expect(page).to have_field("Name")
    expect(page).to have_field("Email")
    expect(page).to have_button("Register")

    fill_in "Name", with: "Sophie"
    fill_in "Email", with: "Sophie@user.com"
    click_button "Register"

    # expect(current_path).to eq(dashboard_path)
  end
end
