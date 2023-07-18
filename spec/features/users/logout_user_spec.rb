require 'rails_helper'

RSpec.describe 'User Logout Functionality' do
  before(:each) do
    user = User.create!(name: 'John Smith', email: 'jsmith@aol.com', password: 'password', password_confirmation: 'password')

    visit root_path
    click_link 'Log In'

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Log In'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.name}")

    visit root_path
  end

  it 'no longer displays a link to log in or create an account' do
    expect(page).to_not have_link('Log In')
    expect(page).to_not have_button('Create User')
  end

  it 'displays a link to log out' do
    expect(page).to have_link('Log Out')
  end

  it 'logs out the user and returns to landing page' do
    click_link('Log Out')

    expect(current_path).to eq(root_path)
    expect(page).to have_link('Log In')
    expect(page).to have_button('Create User')
  end
end

