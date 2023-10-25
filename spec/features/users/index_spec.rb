# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Register and Log In', type: :feature do
  before :each do
    @user_1 = User.create!(name: 'Jamie', email: '34@gmail.com', password_digest: "$2a$12$8fZ4BOUSx4FlExUkBlPRdeQ9/k5bbDsOo2keHPuzE34")
    @user_2 = User.create!(name: 'Katie', email: '34997@gmail.com', password_digest: "$2a$12$8fZ4BOUSx4FlExUkBlPRdeQ9/k5bbDsOo2keHPuzE35")
    @user_3 = User.create!(name: 'Lane', email: 'lane@example.com', password: "laneiscool")

    visit '/'
  end

  feature 'As a user' do
    feature 'When I visit the welcome page' do
      feature 'I see a button to Add a New User, and when I click the add a new user button' do
        scenario "I'm routed to '/register' path and see a form to register" do
          expect(page).to have_button('Create a New User')
          click_button 'Create a New User'

          expect(current_path).to eq('/register')

          expect(page).to have_content('Name')
          expect(page).to have_content('Email (must be unique)')
          expect(page).to have_content('Password')
          expect(page).to have_content('Confirm password')
          expect(page).to have_button('Register')

          fill_in 'Name', with: 'George'
          fill_in 'email', with: 'George@gmail.com'
          fill_in 'password', with: '123password'
          fill_in 'password_confirmation', with: '123password'
          click_button 'Register'

          user = User.find_by(name: 'George', email: 'george@gmail.com')
          expect(current_path).to eq user_path(user.id)
        end
        
        feature "And I fill out incomplete information" do
          scenario "I'm routed back to the new user form with a flash message of what I'm missing" do
            click_button 'Create a New User'

            fill_in 'Name', with: 'George'
            fill_in 'password', with: '123password'
            fill_in 'password_confirmation', with: '123password'
            click_button 'Register'

            expect(current_path).to eq('/register')
            expect(page).to have_content("Email can't be blank")
          end
        end

        feature "And I fill out the information with non-matching passwords" do
          scenario "I'm routed back to the new user form with a flash message of what I'm missing" do
            click_button 'Create a New User'

            fill_in 'Name', with: 'George'
            fill_in 'email', with: 'George@gmail.com'
            fill_in 'password', with: '123password'
            fill_in 'password_confirmation', with: 'password321'
            click_button 'Register'

            expect(current_path).to eq('/register')
          end
        end
      end

      feature 'I see a link for Log In, and when I click on Log In' do
        feature "I'm taken to a Log In page where I can input my unique email and password" do
          scenario "When I enter my unique email and correct password, I'm taken to my dashboard page" do
            expect(page).to have_link("Login")

            click_link "Login"

            expect(current_path).to eq("/login")

            expect(page).to have_content("Email")
            expect(page).to have_content("Password")
            
            fill_in 'Email', with: @user_3.email
            fill_in 'Password', with: @user_3.password

            click_on "Login"

            expect(current_path).to eq("/users/#{@user_3.id}")
          end

          scenario "When I enter a correct email and an incorrect password, I'm redirected back to the login page" do
            click_link "Login"

            fill_in 'Email', with: @user_3.email
            fill_in 'Password', with: "Incorrect Password"

            click_on "Login"

            expect(current_path).to eq("/login")
          end
        end
      end
    end
  end

  feature "As a logged in user" do
    feature "When I visit the landing page" do
      scenario "I no longer see a link to Log In or Create an Account, but I do see a link to Log Out." do
        click_button 'Create a New User'

        fill_in 'Name', with: 'George'
        fill_in 'email', with: 'George@gmail.com'
        fill_in 'password', with: '123password'
        fill_in 'password_confirmation', with: '123password'
        click_button 'Register'

        visit "/"
        
        expect(page).to have_link("Log out")
        expect(page).to_not have_link("Login")
        expect(page).to_not have_button("Create a New User")
      end

      feature "When I click the link to Log Out" do
        scenario "I'm taken to the landing page and I can see that the Log Out link has changed back to a Log In link" do
          click_button 'Create a New User'

          fill_in 'Name', with: 'George'
          fill_in 'email', with: 'George@gmail.com'
          fill_in 'password', with: '123password'
          fill_in 'password_confirmation', with: '123password'
          click_button 'Register'

          visit "/"

          click_on "Log out"

          expect(current_path).to eq("/")

          expect(page).to have_link("Login")
          expect(page).to have_button("Create a New User")
          expect(page).to_not have_link("Log out")
        end
      end
    end
  end
end
