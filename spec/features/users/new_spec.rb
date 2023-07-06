require 'rails_helper'

RSpec.describe 'User registration page' do
  before(:each) do
    visit '/register'
  end

  it 'displays a new user registration form' do
    expect(page).to have_content('Register New User')
    expect(page).to have_field('name')
    expect(page).to have_field('email')
    expect(page).to have_button('Create')
  end

  it 'registers a new user' do
    fill_in 'name', with: 'John Adams'
    fill_in 'email', with: 'jadams76@gmail.com'
    click_button 'Create'

    expect(current_path).to eq("/users/#{User.last.id}")
  end

  it 'displays an error if form is incomplete' do 
    fill_in 'email', with: 'jadams6@gmail.com'
    click_button 'Create'

    expect(current_path).to eq('/register')
    expect(page).to have_content("Name can't be blank")
  end
end
