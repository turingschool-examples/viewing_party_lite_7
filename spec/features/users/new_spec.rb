require 'rails_helper'
# As a visitor 
# When I visit `/register`
# I see a form to fill in my name, email, password, and password confirmation.
# When I fill in that form with my name, email, and matching passwords,
# I'm taken to my dashboard page `/users/:id`

RSpec.describe 'New User Form', type: :feature do
  before(:each) do
    visit '/register'
  end
  describe 'Happy Path create a new user' do
    it 'using valid data' do
      fill_in 'Name', with: 'Wolfie'
      fill_in 'Email', with: 'wolfie@gmail.com'
      fill_in 'Password', with: 'wolf'
      fill_in 'Password Confirmation', with: 'wolf'


      click_button 'Create User'
      # require 'pry'; binding.pry
      new_user = User.all.last
      expect(current_path).to eq("/users/#{User.all.last.id}")
      expect(page).to have_content("#{new_user.name}'s Dashboard")
      expect(page).to have_content("#{new_user.email}")
      expect(page).to have_content('User successfully registered.')
    end

    it 'using invalid name data' do
      fill_in 'Name', with: ''
      fill_in 'Email', with: 'wolfie@gmail.com'
      click_button 'Create User'

      expect(current_path).to eq('/register')
      expect(page).to have_content("Error: Name can't be blank")
    end

    it 'using invalid email data' do
      fill_in 'Name', with: 'Wolfie'
      fill_in 'Email', with: ''
      click_button 'Create User'

      expect(current_path).to eq('/register')
      expect(page).to have_content("Error: Email can't be blank")
    end

    it 'using invalid password confirmation' do
      fill_in 'Name', with: 'Wolfie'
      fill_in 'Email', with: 'wolfie@gmail.com'
      fill_in 'Password', with: 'wolf'

      click_button 'Create User'
# save_and_open_page
      # fill_in 'Password Confirmation', with: ''
      expect(current_path).to eq('/register')
      expect(page).to have_content("Error: Password confirmation doesn't match Password")

      
    end
  end
end
