require "rails_helper"

RSpec.describe "Root" do
  before :each do
    test_data 
  end

  it "can create a new user with all attributes" do
    visit "/register"

    fill_in "Name", with: "Name"
    fill_in "email", with: "email@email.com"
  
    click_button "Register"

    expect(current_path).to eq("/")
  end

  it "rejects repeat emails" do
    visit "/register"

    fill_in "Name", with: "Name"
    fill_in "email", with: "email@email.com"
  
    click_button "Register"
    visit "/register"

    fill_in "Name", with: "Name"
    fill_in "email", with: "email@email.com"
  
    click_button "Register"
    expect(current_path).to eq("/register")
    expect(page).to have_content("This email is already registered")
  end

end