require 'rails_helper'

RSpec.describe 'Movies Show Page', :vcr do
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
  end
end