require 'rails_helper'

RSpec.describe 'User Registration Page' do 
  before(:each) do
    load_test_data
  end

  it 'When a user visits the register path they should see a form to register.' do

    visit root_path
    expect(page).to have_link("Capitainlearyo")
    expect(page).to have_link("Slick Ric")
    expect(page).to have_link("Bob")

    expect(page).to have_button("Create a New User")
    click_button "Create a New User"
    expect(current_path).to eq(new_user_path)
    
    fill_in "Name", with: "Jon"
    fill_in "Email", with: "Jon@a_website.com"

    click_button "Register"
    
    expect(page).to have_content("Jon's Dashboard")

    visit root_path

    expect(page).to have_link("Capitainlearyo")
    expect(page).to have_link("Slick Ric")
    expect(page).to have_link("Bob")
    expect(page).to have_link("Jon")
  end
end