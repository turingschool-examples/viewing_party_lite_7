require 'rails_helper'

RSpec.describe 'Landing Page' do 
  before(:each) do
    load_test_data
  end

  it 'When a user visits the root path they should be on the landing page which includes:' do

    visit "/"

    expect(page).to have_content("ViewingPartyLite7")
    expect(page).to have_button("Create a New User")

    expect(page).to have_link("Go to Landing Page")
    expect(page).to have_link("Tom")
    expect(page).to have_link("Jerry")
    expect(page).to have_link("Bob")
  end
end