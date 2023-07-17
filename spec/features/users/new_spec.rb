require 'rails_helper'

RSpec.describe 'User registration page' do
  before(:each) do
    visit register_path
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

    expect(current_path).to eq(user_path(User.last.id))
  end

  it 'displays an error if name is incomplete' do
    fill_in :user_email, with: 'jadams6@gmail.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Register'

    expect(current_path).to eq(register_path)
    expect(page).to have_content("Name can't be blank")
  end

  it 'displays an error if email is incomplete' do
    fill_in :user_name, with: 'John Adams'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Register'
    
    expect(current_path).to eq(register_path)
    expect(page).to have_content("Email can't be blank")
  end

  it 'displays an error if email is not unique' do
    user = User.create!(name: 'John Smith', email: 'jsmith@aol.com', password: 'password', password_confirmation: 'password')

    fill_in :user_name, with: 'Joshua Adams'
    fill_in :user_email, with: 'JSMith@aol.com'
    fill_in :user_password, with: 'password123'
    fill_in :user_password_confirmation, with: 'password123'
    click_button 'Register'

    expect(current_path).to eq(register_path)
    expect(page).to have_content('Email has already been taken')
  end

  it 'displays an error if password is incomplete' do
    fill_in :user_name, with: 'John Adams'
    fill_in :user_email, with: 'jadams76@gmail.com'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Register'

    expect(current_path).to eq(register_path)
    expect(page).to have_content("Password can't be blank")
  end

  it 'displays an error if password confirmation is incomplete and/or doesnt match password' do
    fill_in :user_name, with: 'John Adams'
    fill_in :user_email, with: 'jadams76@gmail.com'
    fill_in :user_password, with: 'password'
    click_button 'Register'

    expect(current_path).to eq(register_path)
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
