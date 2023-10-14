# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'register new user', type: :feature do
  it 'displays a form to create a user' do
    visit new_user_path

    expect(page).to have_field('Name')
    expect(page).to have_field('Email')
    expect(page).to have_button('Register')

    fill_in 'Name', with: 'Allan'
    fill_in 'Email', with: 'allan@allan.com'

    click_button 'Register'

    expect(page).to have_content('Allan')
  end
end
