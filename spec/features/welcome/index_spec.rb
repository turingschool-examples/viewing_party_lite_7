# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Welcome', type: :feature do
  before :each do
    @user_1 = User.create!(name: 'Jamie', email: '34@gmail.com', password_digest: "$2a$12$8fZ4BOUSx4FlExUkBlPRdeQ9/k5bbDsOo2keHPuzE34")
    @user_2 = User.create!(name: 'Katie', email: '34997@gmail.com', password_digest: "$2a$12$8fZ4BOUSx4FlExUkBlPRdeQ9/k5bbDsOo2keHPuzE35")

    visit '/'
  end

  describe 'As a user' do
    describe 'When I visit the root path' do
      it 'displays the title of the application' do
        expect(page).to have_content('Viewing Party')
      end

      it 'displays a button to create a new user' do
        expect(page).to have_button('Create a New User')
      end

      xit 'displays a list of existing users and a link to each users dashboard' do
        expect(page).to have_link(@user_1.name.to_s)
        expect(page).to have_link(@user_2.name.to_s)
      end

      it 'displays a link to go back to the landing page' do
        expect(page).to have_link('Back to Viewing Party Home Page')

        click_link 'Back to Viewing Party Home Page'

        expect(current_path).to eq('/')
      end
    end
  end


  feature "As a visitor" do
    feature "When I visit the landing page" do
      scenario "I do not see the section of the page that lists existing users" do
        expect(page).to_not have_link(@user_1.name)
        expect(page).to_not have_link(@user_2.name)
      end
    end
  end

  feature "As a registered user" do
    feature "When I visit the landing page" do
      scenario "The list of existing users is no longer a link to their show pages, but just a list of email addresses" do
        click_button 'Create a New User'

        fill_in 'Name', with: 'George'
        fill_in 'email', with: 'George@gmail.com'
        fill_in 'password', with: '123password'
        fill_in 'password_confirmation', with: '123password'
        click_button 'Register'

        visit "/"

        expect(page).to_not have_link(@user_1.name)
        expect(page).to_not have_link(@user_2.name)
        expect(page).to have_content(@user_1.email)
        expect(page).to have_content(@user_2.email)
      end
    end
  end

  feature "As a visitor" do
    feature "When I visit the landing page and then try to visit my user dashboard" do
      scenario "I remain on the landing page and I see a message telling me that I must be logged in or registered to access my dashboard" do
        visit "/users/#{@user_1.id}"

        expect(current_path).to eq('/')
        expect(page).to have_content("You must be logged in or registered to access your dashboard")
      end
    end
  end

  feature "As a logged in user" do
    feature "When I try to visit another users dashboard" do
      scenario "I only see a 404 page" do
        click_button 'Create a New User'

        fill_in 'Name', with: 'George'
        fill_in 'email', with: 'George@gmail.com'
        fill_in 'password', with: '123password'
        fill_in 'password_confirmation', with: '123password'
        click_button 'Register'

        visit "/users/#{@user_1.id}"

        expect(page).to have_content("The page you were looking for doesn't exist.")
      end
    end
  end
end
