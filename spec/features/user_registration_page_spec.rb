require 'rails_helper'

RSpec.describe '/register', type: :feature do
  before do
    visit '/register'
  end
  describe "When a user visits the registration page" do
    it 'should have a form to register' do
      expect(page).to have_content("Register User")
    end

    it "should fill in form, click submit, and be redirected to dashboard ('/users/:id'), where id was the user.id just created" do
      fill_in :name, with: "Larry"
      fill_in :email, with: "Larry@yahoo.com"

      click_button "Submit"
      expect(current_path).to eq("/users/#{User.last.id}")
      expect(page).to have_content("Larry")
      expect(page).to have_content("Larry@yahoo.com")
    end
  end
end