require 'rails_helper'

RSpec.describe 'Landing Page' do
  before(:each) do
    @user1 = User.create!(name: 'John Smith', email: 'jsmith@aol.com', password: 'password', password_confirmation: 'password')
    @user2 = User.create!(name: 'Jane Doe', email: 'jdoe@gmail.com', password: 'password1', password_confirmation: 'password1')
    @user3 = User.create!(name: 'Michael Jackson', email: 'mjack@gmail.com', password: 'password2', password_confirmation: 'password2')

    visit root_path
  end

  it 'displays the title of the application' do
    within('#title') do
      expect(page).to have_content('Viewing Party')
    end
  end

  it 'displays a button to create a new user when not logged in' do
    within('#create-user') do
      expect(page).to have_button('Create User')
    end
  end

  it 'displays a list of existing user emails when logged in' do
    click_link 'Log In'

    fill_in :email, with: @user1.email
    fill_in :password, with: @user1.password
    click_button 'Log In'

    visit root_path

    expect(page).to have_content('Existing Users')
    expect(page).to have_content(@user1.email)
    expect(page).to have_content(@user2.email)
    expect(page).to have_content(@user3.email)
  end

  it 'displays a link to go back to the landing page' do
    within('#nav-bar') do
      expect(page).to have_link('Home')

      click_link('Home')
      expect(current_path).to eq(root_path)
    end
  end

  it 'displays a link to log in' do
    within('#nav-bar') do
      expect(page).to have_link('Log In')

      click_link('Log In')
      expect(current_path).to eq(login_path)
    end
  end

  it 'does not display the list of existing user emails when not logged in' do
    expect(page).to_not have_content('Existing Users')
    expect(page).to_not have_content(@user1.email)
    expect(page).to_not have_content(@user2.email)
    expect(page).to_not have_content(@user3.email)
  end

  it 'does not allow a visitor to visit a user dashboard' do
    visit user_path(@user1)

    expect(current_path).to eq(root_path)
    expect(page).to have_content('You must be logged in or registered to access your dashboard')
  end
end
