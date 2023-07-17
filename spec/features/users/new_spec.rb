require 'rails_helper'

RSpec.describe 'User registration page' do
  before(:each) do
    visit '/register'
  end

  it 'displays a new user registration form' do
    expect(page).to have_content('Register New User')
    expect(page).to have_field(:user_name)
    expect(page).to have_field(:user_email)
    expect(page).to have_field(:user_password)
    expect(page).to have_field(:user_password_confirmation)
    expect(page).to have_button('Register')
  end

  it 'registers a new user' do
    fill_in :user_name, with: 'John Adams'
    fill_in :user_email, with: 'jadams76@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Register'

    expect(current_path).to eq("/users/#{User.last.id}")
  end

  it 'displays an error if form is incomplete' do
    fill_in :user_email, with: 'jadams6@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Register'

    expect(current_path).to eq('/register')
    expect(page).to have_content("Name can't be blank")
  end
end
