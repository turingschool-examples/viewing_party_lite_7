require 'rails_helper'

RSpec.describe 'user dashboard page', type: :feature do
  it 'lists the users name' do
    user = User.create(name: 'Kam', email: 'kameronk013@gmail.com')

    visit "/users/#{user.id}"

    expect(page).to have_content("#{user.name}'s Dashboard")
    expect(page).to have_button('Discover Movies')
    within('#viewing-parties') do
      expect(page).to have_content("Parties I'm Hosting")
      expect(page).to have_content("Parties I'm Invited To")
    end
    save_and_open_page
  end
end
