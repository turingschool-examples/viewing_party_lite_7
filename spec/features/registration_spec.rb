require 'rails_helper'

RSpec.describe 'Registration Page' do
  describe 'registration happy path' do 
    it 'allows a user to register' do 
      bob = User.create!(name: "Bob the Dragqueen", email: "Bobthehoe@hotmess.com")

      visit register_path

      fill_in :name, with: "Bob the Dragqueen"
      fill_in :email, with: "Bobthehoe@hotmess.com"
      click_on "Register"
      new_user = User.last.id
      expect(current_path).to eq(user_path(new_user))
    end
  end
  describe 'registration sad path' do 
    it 'serves drama if a user to register without a name' do
      monet = User.create!(name: "Monet Xchange", email: "Monet_Xchange@hotmess.com")

      visit register_path

      fill_in :name, with: "Bob the Dragqueen"
      # fill_in :email, with: ""
      click_on "Register"
      expect(current_path).to eq(register_path)
      
      expect(page).to have_content("Sorry, I'ma need you to try harder.")
    end
  end
end