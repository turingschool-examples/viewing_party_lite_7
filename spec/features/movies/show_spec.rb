# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the users movies details page', type: :feature do
  describe 'When a user visits the users movies details page' do
    before :each do
      @user = User.create!(name: 'John Smith', email: 'jsmith@aol.com')

      visit user_movies_path(@user)
      click_on 'The Godfather'
    end

    it 'has a button to return to the Discover Page', :vcr do
      expect(page).to have_button('Discover Page')

      click_button 'Discover Page'

      expect(current_path).to eq("/users/#{@user.id}/discover")
    end

    it 'has a button to create a viewing party', :vcr do
      expect(page).to have_button('Create Viewing Party for The Godfather')

      click_button 'Create Viewing Party for The Godfather'

      expect(current_path).to eq("/users/#{@user.id}/movies/238/viewing_party/new")
    end

    it 'shows the movies title, vote average, runtime, genre, summary, first 10 cast member, and reviews', :vcr do
      expect(page).to have_content('The Godfather')
      expect(page).to have_content('Vote Average: 8.708')
      expect(page).to have_content('Runtime: 2h 55mins')
      expect(page).to have_content('Genres: Drama, Crime')
      expect(page).to have_content('Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.')

      within('#cast') do
        expect(page).to have_content('Marlon Brando as Don Vito Corleone')
        expect(page).to have_content('Al Pacino as Michael Corleone')
        expect(page).to have_content('James Caan as Sonny Corleone')
      end

      within('#reviews') do
        expect(page).to have_content('Suresh Chidurala')
        expect(page).to have_content('Great Movie **Ever**')
      end
    end
  end
end
