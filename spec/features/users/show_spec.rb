require 'rails_helper'

describe 'User Dashboard Page' do
  before :each do
    test_data
    visit user_path(@user1)
  end

  it "has user's name at top of page" do
    expect(page).to have_content("Shawn's Dashboard")
    expect(page).to_not have_content("Anthea's Dashboard")
  end

  it 'has a button to discover movies' do
    expect(page).to have_button('Discover Movies')
  end

  it 'has a section that lists viewing parties' do
    expect(page).to have_content('Viewing Parties')
    expect(page).to have_content('Eraserhead')
    expect(page).to have_content('E.T.')
    expect(page).to_not have_content('Eternal Sunshine of the Spotless Mind')
  end
end