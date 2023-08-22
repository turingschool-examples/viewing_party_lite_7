require "rails_helper"

RSpec.describe "Landing Page", type: :feature do
  before :each do
    @user_1 = User.create!(name: "Jimmy", email: "movie_buff333@gmail.com")
    @user_2 = User.create!(name: "Timmy", email: "i_hate_movies@gmail.com")
    @user_3 = User.create!(name: "Tammy", email: "gamer4134@gmail.com")
  end
  describe "#index" do
    it "displays the title of the application" do
      visit root_path

      expect(page).to have_content("Viewing Party!")
    end

    it "has a button to create a new user" do
      visit root_path

      within "#new_user" do
        expect(page).to have_button("Create New User")
        click_button("Create New User")
      end
      expect(current_path).to eq(register_path)
    end

    it "displays a list of existing users" do
      visit root_path

      within "#existing_users" do
        expect(page).to have_content("movie_buff333@gmail.com")
        expect(page).to have_content("i_hate_movies@gmail.com")
        expect(page).to have_content("gamer4134@gmail.com")
      end
    end
  end
end