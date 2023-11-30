require 'rails_helper'

RSpec.describe 'landing page', type: :feature do
  # this test applies to all pages
  it 'has a link to the landing page' do
    visit '/'

    expect(page).to have_link('Viewing Party Landing Page')
    click_link('Viewing Party Landing Page')
    expect(current_path).to eq(root_path)
  end

  it 'contains the name of the application' do
    visit '/'

    expect(page).to have_content('Viewing Party')
  end

  it 'has a button to create a new user' do
    visit '/'

    expect(page).to have_button('New User')
    click_button('New User')
    expect(current_path).to eq('/register')
  end

  it 'has a list of existing users' do
    user_1 = User.create(name: 'Kam', email: 'kameron@turing.edu')
    user_2 = User.create(name: 'Joseph', email: 'joseph@turing.edu')

    visit '/'

    expect(page).to have_content(user_1.name)
    expect(page).to have_content(user_2.name)
    expect(page).to have_link(user_1.name)
    click_link(user_1.name)
    expect(current_path).to eq("/users/#{user_1.id}")
  end
end
