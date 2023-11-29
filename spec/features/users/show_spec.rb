require 'rails_helper'

RSpec.describe 'User show page', type: :feature do

  before(:each) do
    load_test_data
    visit "/users/#{@user1.id}"
  end

  it "displays the user's name and 'Dashboard' at the top of the page" do
    expect(page).to have_content("#{@user1.name}'s Dashboard")
  end

  it "displays a 'Discover Movies' button" do
    expect(page).to have_button('Discover Movies')
  end

  it 'displays a section that lists viewing parties' do
    within('section.viewing-parties') do
      expect(page).to have_css('h2', text: 'Viewing Parties')
    end
  end
end
