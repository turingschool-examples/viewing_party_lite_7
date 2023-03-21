require 'rails_helper'

RSpec.describe 'User Registration Page' do

  it 'should be able to fill in a form and create a new user' do
    visit '/register'
  
    fill_in :name, with: "Matt Smith"
    fill_in :email, with: 'mattsmith@emails.com'

    click_button 'Register'
    new_user = User.last

    expect(current_path).to eq(user_path(new_user))
    expect(page).to have_content('Matt Smith')
    expect(page).to have_content(new_user.id)
  end

  it 'should be prompted to fill in valid information if invalid information is submitted' do
    visit '/register'
  
    fill_in :name, with: ''
    fill_in :email, with: 'mattsmith@emails.com'

    click_button 'Register'
    new_user = User.last
    save_and_open_page
    expect(current_path).to eq('/register')
    expect(page).to have_content("Name can't be blank")
  end
end
