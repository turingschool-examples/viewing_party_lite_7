require 'rails_helper'

RSpec.describe 'Visit Landing Page', type: :feature do
  before do
    visit '/'
  end

  it 'includes title of application' do
    expect(page).to have_content('Viewing Party')
  end

  it 'includes button to create a new user' do
    expect(page).to have_button('Create New User')
    click_button 'Create New User'
    expect(current_path).to eq(new_user_path)
  end

  it 'includes a list of existing users which link to their dashboard' do
    expect(page).to have_content('Existing Users')
    expect(page).to have_link('jonsmith@gmail.com')
    expect(page).to have_link('janedoe@aol.com')
    expect(page).to have_link('snoopdogg@gmail.com')
  end

  it 'includes a link to go back to the landing page(present on all pages)' do
    expect(page).to have_link('Home')
  end
end
