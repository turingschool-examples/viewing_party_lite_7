# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.feature 'User New(register)' do
  it 'has a form with attributes' do
    visit register_path

    expect(page).to have_content('Name')
    expect(page).to have_field(:name)
    expect(page).to have_content('Email')
    expect(page).to have_field(:email)
    expect(page).to have_button('Create New User')
  end

  it '(happy path)it can create a user' do
    visit register_path

    fill_in :name, with: 'Joop'
    fill_in :email, with: 'Joop@aol.com'
    fill_in :password, with: 'Hotdog12?'
    fill_in :password_confirmation, with: 'Hotdog12?'

    click_button 'Create New User'

    expect(page).to have_current_path(user_path(User.all.last))
    expect(page).to have_content("Joop's Dashboard")
    
    expect(page).to have_content("Welcome, joop@aol.com")
  end
  
  it '(sad path)it will not create a user without a matching password_confirmation' do
    visit register_path
    
    fill_in :name, with: 'Doug'
    fill_in :email, with: 'Doug@gmail.com'
    fill_in :password, with: 'Hotdog12?'
    fill_in :password_confirmation, with: 'Hotdog13?'

    click_button 'Create New User'

    expect(page).to have_current_path(register_path)
    binding.pry
    expect(page).to have_content("Error: Password confirmation doesn't match Password")
  end

  it '(sad path)it will not create a user without a password_confirmation that matches' do
    visit register_path
    
    fill_in :name, with: 'Doug'
    fill_in :email, with: 'Doug@gmail.com'
    fill_in :password, with: 'Hotdog12?'

    click_button 'Create New User'

    expect(page).to have_current_path(register_path)
    expect(page).to have_content("Error: Password confirmation doesn't match Password")
  end

  it '(sad path)it will not create a user without a password' do
    visit register_path

    fill_in :name, with: 'Doug'
    fill_in :email, with: 'Doug@gmail.com'

    click_button 'Create New User'

    expect(page).to have_current_path(register_path)
    expect(page).to have_content("Error: Password can't be blank")
  end

  it '(sad path)it will not create a user with invalid characters in the email' do
    visit register_path

    fill_in :name, with: 'Doug'
    fill_in :email, with: 'Doug=Doug@gmail.com'
    fill_in :password, with: 'Hotdog12?'

    click_button 'Create New User'

    expect(page).to have_current_path(register_path)
    expect(page).to have_content('Error: Email is invalid')
  end

  it '(sad path)it will not create a user with an invalid email' do
    visit register_path

    fill_in :name, with: 'Doug'
    fill_in :email, with: 'Doug'
    fill_in :password, with: 'Hotdog12?'

    click_button 'Create New User'

    expect(page).to have_current_path(register_path)
    expect(page).to have_content('Error: Email is invalid')
  end

  it '(sad path)it will not create a user without email' do
    visit register_path

    fill_in :name, with: 'Doug'
    fill_in :password, with: 'Hotdog12?'

    click_button 'Create New User'

    expect(page).to have_current_path(register_path)
    expect(page).to have_content("Error: Email can't be blank")
  end

  it '(sad path)it will not create a user without name' do
    visit register_path

    fill_in :email, with: 'Doug@yahoo.com'
    fill_in :password, with: 'Hotdog12?'

    click_button 'Create New User'

    expect(page).to have_current_path(register_path)
    expect(page).to have_content("Error: Name can't be blank")
  end

  it '(sad path)it will not create a user with a redundant email (case insensitive)' do
    User.create!(name: 'Anne Anderson', email: 'anne.anderson@aol.com', password: "Hotdog12?")

    visit register_path

    fill_in :name, with: 'Anne'
    fill_in :email, with: 'Anne.Anderson@aol.com'
    fill_in :password, with: 'Hotdog12?'

    click_button 'Create New User'

    expect(page).to have_current_path(register_path)
    expect(page).to have_content('Error: Email has already been taken')
  end
end

# rubocop:enable Metrics/BlockLength
