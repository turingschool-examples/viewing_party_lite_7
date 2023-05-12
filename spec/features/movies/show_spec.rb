require 'rails_helper'

RSpec.describe 'Movies Show Page', :vcr do
  let!(:user_1) { User.create!(name: "Angel Byun", email: "angelbyun@turing.edu") }
  let!(:user_2) { User.create!(name: "Isaac Thill", email: "isaacthill@turing.edu") }
  let!(:user_3) { User.create!(name: "Scott Le", email: "scottle@gmail.com") }
  let!(:user_4) { User.create!(name: "Megan Hinricher", email: "hinmeg@gmail.com") }

  describe 'movies show page' do
    it 'lists a movies details' do
      visit "/movies/238"

      expect(page).to have_content("The Godfather")
      expect(page).to have_content("Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.")
      expect(page).to have_content(8.7)
      expect(page).to have_content(17886)
    end

    it 'has a button to create a viewing party' do
      visit "/movies/238"

      click_button("Create Viewing Party")

      expect(current_path).to eq("/parties/new")
    end

    it 'has a button to go back to discover users page' do
      visit "/movies/238"

      click_button("Discover User Page")

      expect(current_path).to eq("/discover/users/#{user_1.id}")
    end
  end
end