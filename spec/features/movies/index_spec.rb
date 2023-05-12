require 'rails_helper'

RSpec.describe 'movies index page', :vcr do
  describe 'movies index' do
    let!(:user_1) { User.create!(name: "Angel Byun", email: "angelbyun@turing.edu") }
    let!(:user_2) { User.create!(name: "Isaac Thill", email: "isaacthill@turing.edu") }
    let!(:user_3) { User.create!(name: "Scott Le", email: "scottle@gmail.com") }
    let!(:user_4) { User.create!(name: "Megan Hinricher", email: "hinmeg@gmail.com") }

    it 'has a list of top rated movies' do
      visit "/movies"

      expect(page).to have_content("The Godfather")
      expect(page).to have_content("The Shawshank Redemption")
      expect(page).to have_content("Cuando Sea Joven")
      expect(page).to have_content("The Godfather Part II")
      expect(page).to have_content("Dilwale Dulhania Le Jayenge")
      expect(page).to have_content("Spirited Away")
      expect(page).to have_content("12 Angry Men")
      expect(page).to have_content("Your Name.")
      expect(page).to have_content("Parasite")
    end

    it 'can search movies by title and keywords' do
      visit "/discover/users/#{user_1.id}"

      fill_in(:search, with: "god")
      click_button("Search Movie")

      expect(current_path).to eq("/movies")
      # visit "/movies"

      # expect(page).to have_content("Shazam! Fury of the Gods")
    end
  end
end