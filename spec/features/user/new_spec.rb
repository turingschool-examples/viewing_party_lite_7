require 'rails_helper'

RSpec.describe "register user page" do
  describe 'register new user' do
    before :each do
      old_user = User.create( name: 'Jimmy', email: 'oldmail@mail.com' )
    end
    describe 'happy path' do
      it 'registers' do
        visit '/register'
  
        fill_in 'name', with: 'New User'
        fill_in 'email', with: 'newuser@mail.com'
        click_button 'register'
  
        expect(page).to have_content("Welcome New User!")
        expect(current_path).to_not eq('/register')
      end
    end

    describe 'sad path' do
      it 'form not filled out' do
        visit '/register'
        fill_in 'name', with: 'New User'

        click_button 'register'

        expect(page).to have_content("Registration Failed")
        expect(current_path).to eq('/register')
      end

      it 'email already in use' do
        
        fill_in 'name', with: 'New User'
        fill_in 'email', with: 'oldmail@mail.com'
        click_button 'register'

        expect(page).to have_content("Registration Failed")
        expect(current_path).to eq('/register')
      end
    end
  end
end