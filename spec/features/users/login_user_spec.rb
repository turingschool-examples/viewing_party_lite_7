require 'rails_helper'

RSpec.describe 'User Login Page' do
  it 'can log in with valid credentials' do
    user = User.create!(name: 'John Smith', email: 'jsmith@aol.com', password: 'password', password_confirmation: 'password')

    visit root_path
    click_link 'Log In'

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Log In'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.name}")
  end

  it 'cannot log in with invalid password' do
    user = User.create!(name: 'John Smith', email: 'jsmith@aol.com', password: 'password', password_confirmation: 'password')

    visit root_path
    click_link 'Log In'

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: 'wrong_password'
    click_button 'Log In'

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Incorrect Password')
  end

  it 'cannot log in with invalid email' do
    user = User.create!(name: 'John Smith', email: 'jsmith@aol.com', password: 'password', password_confirmation: 'password')

    visit root_path
    click_link 'Log In'

    expect(current_path).to eq(login_path)

    fill_in :email, with: 'js@aol.com'
    fill_in :password, with: 'password'
    click_button 'Log In'

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Email not found')
  end
end