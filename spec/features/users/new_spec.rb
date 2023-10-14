require 'rails_helper'

RSpec.describe 'User Registration Page' do 
  before(:each) do
    load_test_data
  end

  it 'When a user visits the register path they should see a form to register.' do

    visit "/"
    expect(page).to have_link("Tom")
    expect(page).to have_link("Jerry")
    expect(page).to have_link("Bob")
    expect(page).to_not have_link("Jon")

    click_button "Create a New User"
    expect(current_path).to eq(new_user_path)
    
    fill_in "Name", with: "Jon"
    fill_in "Email", with: "Jon@a_website.com"

    click_button "Register"
    

    expect(page).to have_content("Jon's Dashboard")

    visit "/"

    expect(page).to have_link("Go to Landing Page")
    expect(page).to have_link("Tom")
    expect(page).to have_link("Jerry")
    expect(page).to have_link("Jon")
  end
end