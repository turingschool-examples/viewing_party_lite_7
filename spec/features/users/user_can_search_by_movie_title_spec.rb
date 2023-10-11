require 'rails_helper'

feature "user can search for movies" do
  scenario "user submits valid movie name", :vcr do

    visit "/"

    fill_in :search, with: 'Up'
    click_button 'Search'

    expect(page.status_code).to eq 200
    expect(page).to have_content("Up was found!")
    expect(page).to have_content("Up")
  end
end