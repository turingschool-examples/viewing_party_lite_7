require "rails_helper"

RSpec.describe "index page" do
  it "displays landing page" do
    visit "/"
    expect(page).to have_content("Viewing Party Manager")
  end

  it "has button to create new user" do
    visit "/"
    expect(page).to have_button("Create new user")
    click_button "Create new user"
    expect(current_path).to eq("/register")
  end

  it "displays list of all users that links to users dashboard" do
    visit "/"
    expect(page).to have_content("All Users")
    click_link "All Users"
    expect(current_path).to eq("/users")
    expect(page).to have_content("All Users")
  end
end