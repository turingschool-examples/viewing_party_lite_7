require 'rails_helper'

RSpec.describe "/", type: :feature do
  describe "as a user, when I visit the landing page" do 
    before :each do
      @picard = User.create!(name: "Jean-Luc Picard", email: "captain@uss-enterprise.com")
      @riker = User.create!(name: "William Riker", email: "number2@uss-enterprise.com")
      @data = User.create!(name: "Data", email: "data@uss-enterprise.com")

      visit "/"
    end

    it "should display title of app, button to create new user, list of existing users, link to landing page" do
      expect(page).to have_content("Viewing Party")
      expect(page).to have_link("Home")

      expect(page).to have_button("Create a New User")
      expect(page).to have_content("Existing Users:")
      expect(page).to have_link("#{@picard.email}", href: "/users/#{@picard.id}")
      expect(page).to have_link("#{@riker.email}", href: "/users/#{@riker.id}")
      expect(page).to have_link("#{@data.email}", href: "/users/#{@data.id}")
    end

    it "when I click on the button I'm redirected to '/register' page" do
      click_button("Create a New User")
      expect(current_path).to eq("/register")
    end

    it "when I click on a user name link I'm redirected to '/users/:id' page" do
      click_link("#{@picard.email}")
      expect(current_path).to eq("/users/#{@picard.id}")
      expect(page).to have_content("#{@picard.name}")
      expect(page).to_not have_content("#{@riker.name}")
    end
  end
end