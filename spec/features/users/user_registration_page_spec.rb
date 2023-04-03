require 'rails_helper'

RSpec.describe '/register', type: :feature do
  before do
    @steve = User.create!(name: "steve", email: "steve@steve.com", password: "steve123")
    visit '/register'
  end

  describe "When a user visits the registration page" do
    it 'should have a form to register' do
      expect(page).to have_content("Register User")
    end

    it "should fill in form, click submit, and be redirected to dashboard ('/users/:id'), where id was the user.id just created" do
      fill_in :name, with: "Larry"
      fill_in :email, with: "Larry@yahoo.com"
      fill_in :password, with: "Larry123"
      fill_in :password_confirmation, with: "Larry123"

      click_button "Submit"
      expect(current_path).to eq("/users/#{User.last.id}")
      expect(page).to have_content("User was successfully created")
    end
    
    describe 'sad paths for user registration' do
      it "should not create a user if email is not filled in" do
        fill_in :name, with: "Katie"
        click_button "Submit"

        expect(current_path).to eq("/register")
      end

      it "should not create a user if email is not unique " do
        fill_in :name, with: "Katie"
        fill_in :email, with: "steve@steve.com"
        fill_in :password, with: "Katie123"
        fill_in :password_confirmation, with: "Katie123"

        click_button "Submit"

        expect(page).to have_content("Email has already been taken")
        expect(current_path).to eq("/register")
      end

      it 'should not create a user if password is not filled in' do
        fill_in :name, with: "Katie"
        fill_in :email, with: "Katie@Katie.edu"

        click_button "Submit"

        expect(page).to have_content("Password can't be blank")
        expect(current_path).to eq("/register")
      end

      it 'should not create a user if password confirmation does not match password' do
        fill_in :name, with: "Katie"
        fill_in :email, with: "Katie@Katie.edu"
        fill_in :password, with: "Katie123"
        fill_in :password_confirmation, with: "Katie321"

        click_button "Submit"

        expect(page).to have_content("Password confirmation doesn't match Password")
        expect(current_path).to eq("/register")
      end
    end
  end
end