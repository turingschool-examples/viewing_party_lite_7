require 'rails_helper'

RSpec.describe 'New User Form', type: :feature do
  before(:each) do
    visit register_path
  end
  describe 'Happy Path create a new user' do
    it 'using valid data' do
      fill_in 'Name', with: 'Wolfie'
      fill_in 'Email', with: 'wolfie@gmail.com'
      fill_in 'Password', with: 'wolf'
      fill_in 'Password Confirmation', with: 'wolf'

      click_button 'Create User'
      new_user = User.last
     
      expect(current_path).to eq(root_path)
      expect(page).to have_content("User successfully registered. Please log in to visit your Dashboard")
      
      click_on"Log In"
  
      fill_in :email, with: 'wolfie@gmail.com'
      fill_in :password, with: 'wolf'
      click_on "Log In"
      expect(page).to have_content("Welcome Back Wolfie!")
      click_button"My Dashboard"

      # expect(current_path).to eq("/users/#{User.all.last.id}")
      expect(page).to have_content("Wolfie's Dashboard")
      expect(page).to have_content("Email: wolfie@gmail.com")
    end

    it 'Sad path name field is left blank' do
      fill_in 'Name', with: ''
      fill_in 'Email', with: 'wolfie@gmail.com'
      click_button 'Create User'

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Error: Name can't be blank")
    end

    it 'Sad Path using invalid email' do
      fill_in 'Name', with: 'Wolfie'
      fill_in 'Email', with: ''
      click_button 'Create User'

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Error: Email can't be blank")
    end

    it 'Sad Path using an email thats already attached to a user' do
       user3 = User.create!(name: 'Wolfie', email: 'wolfie@gmail.com',  password: 'wolf', password_confirmation: 'wolf')

      fill_in 'Name', with: 'Wolf Man'
      fill_in 'Email', with: 'wolfie@gmail.com'
      fill_in 'Password', with: 'wolf'
      fill_in 'Password Confirmation', with: 'wolf'
      click_button 'Create User'

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Error: Email has already been taken")
    end
    it 'Sad Path blank password confirmation field' do
      fill_in 'Name', with: 'Wolfie'
      fill_in 'Email', with: 'wolfie@gmail.com'
      fill_in 'Password', with: 'wolf'

      click_button 'Create User'
      expect(current_path).to eq(register_path)
      expect(page).to have_content("Error: Password confirmation doesn't match Password")
    end

    it 'Sad PAth using nomatching password in confirmation field' do
      fill_in 'Name', with: 'Wolfie'
      fill_in 'Email', with: 'wolfie@gmail.com'
      fill_in 'Password', with: 'wolf'
      fill_in 'Password Confirmation', with: 'cat'

      click_button 'Create User'
      expect(current_path).to eq(register_path)
      expect(page).to have_content("Error: Password confirmation doesn't match Password")
    end
  end
end
