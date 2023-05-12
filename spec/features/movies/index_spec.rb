require 'rails_helper'

RSpec.describe 'movies index page', :vcr do
  describe 'movies index' do
    let!(:user_1) { User.create!(name: "Angel Byun", email: "angelbyun@turing.edu") }
    let!(:user_2) { User.create!(name: "Isaac Thill", email: "isaacthill@turing.edu") }
    let!(:user_3) { User.create!(name: "Scott Le", email: "scottle@gmail.com") }
    let!(:user_4) { User.create!(name: "Megan Hinricher", email: "hinmeg@gmail.com") }

    it 'has a list of top rated movies' do
      visit "/users/#{user_1.id}/movies"

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
      visit "/users/#{user_1.id}/discover"

      fill_in(:query, with: "god")
      click_button("Search Movie")

      expect(current_path).to eq("/users/#{user_1.id}/movies")
      visit "/users/#{user_1.id}/movies"

      expect(page).to have_content("Shazam! Fury of the Gods")
    end

    it 'creates a link to the top rated movies detail page' do
      visit "/users/#{user_1.id}/movies"

      click_link("The Godfather")

      expect(current_path).to eq("/users/#{user_1.id}/movies/238")
    end
  end
end