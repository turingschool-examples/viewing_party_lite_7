require 'rails_helper'

RSpec.describe 'Registration Page' do
  describe 'registration happy path' do 
    it 'allows a user to register' do
      visit register_path

      fill_in :name, with: "Bob the Dragqueen"
      fill_in :email, with: "Bobthehoe@hotmess.com"
      click_on "Register"
      new_user = User.last
      expect(current_path).to eq(dashboard_path(new_user.id))
    end
  end
  
  describe 'registration sad path' do 
    it 'serves drama if a user to register without a name' do
      monet = User.create!(name: "Monet Xchange", email: "Monet_Xchange@hotmess.com")

      visit register_path

      fill_in :name, with: "Monet Xchange"
      fill_in :email, with: ""
      click_on "Register"
      expect(current_path).to eq(register_path)
      
      expect(page).to have_content("Sorry, I'ma need you to try harder.")
    end
  end
end