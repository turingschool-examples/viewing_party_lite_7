require 'rails_helper'

RSpec.feature 'home landing page', type: :view do
  it 'displays the landing page with links' do
    visit new_user_path

    expect(page).to have_field('Name')
    expect(page).to have_field('Email')
    expect(page).to have_button('Create User')

    fill_in 'Name', with: 'Allan'
    fill_in 'Email', with: 'allan@allan.com'

    click_button 'Create User'

    expect(page).to have_content('Allan')
    expect(page).to have_content('allan@allan.com')
  end
end 