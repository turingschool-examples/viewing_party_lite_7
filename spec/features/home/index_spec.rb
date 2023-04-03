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
      it "should display title of app, link to create new user, list of existing users, link to landing page, & log in link" do
        expect(page).to have_content("Viewing Party")
        expect(page).to have_link("Home")

        expect(page).to have_link("Create a New User")
        # expect(page).to have_content("Existing Users:")
        # expect(page).to have_link("#{@picard.email}", href: "/users/#{@picard.id}")
        # expect(page).to have_link("#{@riker.email}", href: "/users/#{@riker.id}")
        # expect(page).to have_link("#{@data.email}", href: "/users/#{@data.id}")
        expect(page).to have_link("Log In", href: "/login")
      end

      it "when I click Log In link & am taken the login form page" do      
        click_link("Log In")
        expect(current_path).to eq("/login")
    end
      
      it 'has a link to home that returns to the landing page' do
        visit register_path
        click_link("Home")
        
        expect(current_path).to eq(root_path)
      end

      it "when I click on the Create button I'm redirected to '/register' page" do
        click_link("Create a New User")
        expect(current_path).to eq("/register")
      end

      # it "when I click on a user name link I'm redirected to '/users/:id' page" do
      #   click_link("#{@picard.email}")
      #   expect(current_path).to eq("/users/#{@picard.id}")
      #   expect(page).to have_content("#{@picard.name}")
      #   expect(page).to_not have_content("#{@riker.name}")
      # end
    end
  end
end