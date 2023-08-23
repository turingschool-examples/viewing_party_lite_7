require 'rails_helper'

RSpec.describe "register page" do
  it "can successfully register a new user" do
    visit "/register"

    fill_in "Name:", with: "Amy" 
    fill_in "Email:", with: "amy@turing.edu"

    click_button "Create New User"
    
    expect(current_path).to eq(user_path(User.last))
  end

  it "can not register a new user without a name" do
    visit "/register"

    fill_in "Email:", with: "bob@bob.com"

    click_button "Create New User"

    expect(page).to have_content("User could not be created")
    expect(current_path).to eq("/register")
  end
end