require 'rails_helper'

RSpec.describe 'user dashboard page', type: :feature do
  # this test applies to all pages
  it 'has a link to the landing page' do
    visit '/'

    expect(page).to have_link('Viewing Party Landing Page')
    click_link('Viewing Party Landing Page')
    expect(current_path).to eq(root_path)
  end

  it 'lists the users name' do
    user = User.create(name: 'Kam', email: 'kameronk013@gmail.com', password: 'test')

    visit "/users/#{user.id}"

    expect(page).to have_content("#{user.name}'s Dashboard")
    expect(page).to have_button('Discover Movies')
    within('#viewing-parties') do
      expect(page).to have_content("Parties I'm Hosting")
      expect(page).to have_content("Parties I'm Invited To")
    end
  end

  it 'has a button to the Discover Movies page' do
    user = User.create(name: 'Kam', email: 'kameronk013@gmail.com', password: "test")

    visit "/users/#{user.id}"

    expect(page).to have_button('Discover Movies')
    click_button('Discover Movies')
    expect(current_path).to eq(user_discover_path(user.id))
  end
end
