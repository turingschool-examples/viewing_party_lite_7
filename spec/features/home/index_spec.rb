require 'rails_helper'

RSpec.describe "/", type: :feature do
  describe "as a user, when I visit the landing page" do 
    before :each do
      @picard = User.create!(name: "Jean-Luc Picard", email: "captain@uss-enterprise.com", password: "IamCaptain!")
      @riker = User.create!(name: "William Riker", email: "number2@uss-enterprise.com", password: "IamNumber2")
      @data = User.create!(name: "Data", email: "data@uss-enterprise.com", password: "IamData?")

      visit "/"
    end

    describe "happy path tests" do
      it "should display page details, link to login and create new user, list of existing users emails" do
        expect(page).to have_content("Viewing Party")
        expect(page).to have_link("Home")

        expect(page).to have_link("Create a New User")
        expect(page).to have_link("Log In", href: "/login")

        expect(page).to have_content("Existing Users:")
        expect(page).to have_content("#{@picard.email}")
        expect(page).to have_content("#{@riker.email}")
        expect(page).to have_content("#{@data.email}")

        # expect(page).to have_link("#{@picard.email}", href: "/users/#{@picard.id}")
        # expect(page).to have_link("#{@riker.email}", href: "/users/#{@riker.id}")
        # expect(page).to have_link("#{@data.email}", href: "/users/#{@data.id}")
      end
      
      it 'has a Home link that returns to this home page' do
        # visit register_path
        visit "/register"
        click_link("Home")
        
        expect(current_path).to eq(root_path)
      end

      it "when I click Log In link I'm redirected to login form page" do      
        click_link("Log In")
        expect(current_path).to eq("/login")
      end

      it "when I click on the Create button I'm redirected to new user form page" do
        click_link("Create a New User")
        expect(current_path).to eq("/register")
      end

      it "can recognize a login session" do
        click_link("Log In")
        fill_in('Email', with: "number2@uss-enterprise.com")
        fill_in("Password:", with: "IamNumber2")
        click_on("Log In")

        # visit "/"
        click_on("Home")
        expect(current_path).to eq("/")

        expect(page).to have_link("Log Out")

        expect(page).to_not have_link("Log In")
        expect(page).to_not have_link("Create a New User")
      end

      it "can recognize I've logged out when I click the Log Out link" do
        click_link("Log In")
        expect(current_path).to eq("/login")
        fill_in('Email', with: "number2@uss-enterprise.com")
        fill_in("Password:", with: "IamNumber2")
        click_on("Log In")
        expect(current_path).to eq("/dashboard")
        click_on("Home")

        click_on("Log Out")
        expect(current_path).to eq("/")
        
        expect(page).to have_content("You've been successfully logged out.")
        expect(page).to have_link("Log In")
        expect(page).to have_link("Create a New User")
        
        expect(page).to_not have_link("Log Out")
      end

      it "can authorize show page so user cannot visit any dashboard without being logged in" do
        visit "/dashboard"

        expect(current_path).to eq("/")
        expect(page).to have_content("You must be logged in or registered to continue.")
      end

      # Original test when user emails were links:
      # it "when I click on a user name link I'm redirected to '/users/:id' page" do
      #   click_link("#{@picard.email}")
      #   expect(current_path).to eq("/users/#{@picard.id}")
      #   expect(page).to have_content("#{@picard.name}")
      #   expect(page).to_not have_content("#{@riker.name}")
      # end
    end
  end
end