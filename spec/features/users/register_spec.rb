require 'rails_helper'

RSpec.describe 'User register page', :vcr do
  before :each do
    load_test_data
  end

  it 'displays a form to register' do
    visit(register_path)
    expect(page).to have_field('Name')
    expect(page).to have_field('Email')
    expect(page).to have_button('Create New User')
  end

  it 'creates a new user and redirects to the user dashboard' do
    visit(register_path)
    fill_in 'Name', with: 'user4'
    fill_in 'Email', with: 'user4@turing.edu'
    click_button 'Create New User'
  end

  it 'displays a link to go back to the landing page' do
    visit(register_path)
    expect(page).to have_link('Home', href: root_path)
  end

  it 'does not create a new user if the email is not unique' do
    visit(register_path)
    fill_in 'Name', with: 'user4'
    fill_in 'Email', with: @user2.email
    click_button 'Create New User'
    expect(page).to have_content('Email has already been taken')
  end

  it 'does not create a new user if the user field is blank' do
    visit register_path
    click_button 'Create New User'
    expect(page).to have_content("Name can't be blank")
  end

  it 'does not create a new user if the email field is blank' do
    visit register_path
    click_button 'Create New User'
    expect(page).to have_content("Email can't be blank")
  end
end
