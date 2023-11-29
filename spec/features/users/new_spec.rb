require "rails_helper"

RSpec.describe "New" do
  before :each do
    test_data 
  end

  it "can create a new user with all attributes" do
    visit "/register"

    fill_in "Name", with: "Name"
    fill_in "email", with: "email@email.com"
  
    click_button "Create New User"

    expect(current_path).to eq("/users/#{User.all.last.id}")
  end

  it "rejects repeat emails" do
    visit "/register"
    expect(page).to_not have_content("This email is already registered")
    
    fill_in "Name", with: "Name"
    fill_in "email", with: "email@email.com"
    
    click_button "Create New User"
    expect(page).to_not have_content("This email is already registered")
    visit "/register"

    fill_in "Name", with: "Name"
    fill_in "email", with: "email@email.com"
  
    click_button "Create New User"
    expect(current_path).to eq("/register")
    expect(page).to have_content("This email is already registered")
  end

end