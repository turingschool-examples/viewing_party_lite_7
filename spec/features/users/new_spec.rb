require 'rails_helper'

RSpec.describe "new user page" do 
  describe "create a new user form" do
    it "verifies the functionality of the form" do
      visit register_path

      fill_in(:name, with: 'Austin')
      fill_in(:email, with: 'austin@gmail.com')
      click_button('Register')

      expect(current_path).to eq(user_path(User.all.last))
    end
    it "verifies the sad path of the form" do
      visit register_path

      fill_in(:name, with: '')
      fill_in(:email, with: 'austin@gmail.com')
      click_button('Register')

      expect(page).to have_content("Email is not unique or form is not fully complete")
    end
  end
end