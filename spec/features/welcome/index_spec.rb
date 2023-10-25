# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Welcome Index' do
  it 'has a header' do
    visit '/'

    expect(page).to have_link('Home')
    expect(page).to have_content('Viewing Party')

    click_link 'Home'

    expect(page).to have_current_path('/')
  end

  it 'has a button to new user' do
    visit '/'

    expect(page).to have_button('Create a New User')

    click_button 'Create a New User'

    expect(page).to have_current_path(register_path)
  end

  # it 'show all users', :vcr do
  #   load_test_data
  #   visit '/'

  #   expect(page).to have_link(@anne.email)
  #   expect(page).to have_link(@blair.email)
  #   expect(page).to have_link(@cindy.email)

  #   click_link @anne.email

  #   expect(page).to have_current_path(user_path(@anne))
  # end
end
