require 'rails_helper'

RSpec.describe "movie results page", type: :feature do
  before(:each) do
    @user1 = User.create!(name: "Bob", email: "bob@bob.com")
    @user2 = User.create!(name: "John", email: "john@bob.com")
    visit user_discover_path(@user1)
  end
  describe "when I visit the movie results page" do
    it "after I click the top rated movies I see the top rated movies" do
      click_button("Discover Top Movies")
      expect(current_path).to eq("/users/#{@user1.id}/movies")

      expect(page).to have_link("The Godfather")
      expect(page).to have_content("Rating: 8.7")

      expect(page).to have_button("Back")
      click_button("Back")
      expect(current_path).to eq(user_discover_path(@user1))
    end

    it "after I search a movie I see movies that are that movie" do
      fill_in "title", with: ("The fellowship of the ring")
      click_button("Search")
      expect(current_path).to eq("/users/#{@user1.id}/movies")

      expect(page).to have_link("The Lord of the Rings: The Fellowship of the Ring")
      expect(page).to have_content("Rating: 8.396")

      expect(page).to have_button("Back")
      click_button("Back")
      expect(current_path).to eq(user_discover_path(@user1))
    end

    it "if I search with a key word movies with that word in it appear" do
      fill_in "title", with: ("the")
      click_button("Search")
      expect(current_path).to eq("/users/#{@user1.id}/movies")

      expect(page).to have_link("The Pope's Exorcist")
      expect(page).to have_content("Rating: 7.394")

      expect(page).to have_button("Back")
      click_button("Back")
      expect(current_path).to eq(user_discover_path(@user1))
    end
  end
end