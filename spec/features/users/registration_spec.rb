# frozen_sting_literal: true

require 'rails_helper'

RSpec.describe 'User Registration Page' do
  it 'displays a form to register a new User' do
    visit '/register'
    expect(page).to have_field(:name)
    expect(page).to have_field(:email)
    expect(page).to have_button('Register')
  end
  it 'will add a new User to the website' do
    visit '/register'
    User.destroy_all
    fill_in :name, with: 'Xander Hendry'
    fill_in :email, with: 'xanders_fake_email@gmail.com'
    click_button('Register')
    new_user = User.last
    expect(current_path).to eq("/users/#{new_user.id}")
  end
  it 'will only register unique emails' do
    visit '/register'
    User.create( name: 'Xander Hendry', email: 'xanders_fake_email@gmail.com' )
    fill_in :name, with: 'Xander Hendry'
    fill_in :email, with: 'xanders_fake_email@gmail.com'
    click_button('Register')
    expect(current_path).to eq('/register')
    expect(page).to have_content('Error: Email already in use!')
  end
end
