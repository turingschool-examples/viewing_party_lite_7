# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the movies viewing party new page', type: :feature do
  describe 'When a user visits the movies viewing parties new page' do
    before :each do
      @user = User.create!(name: 'John Smith', email: 'jsmith@aol.com')
      @user2 = User.create!(name: 'Jane Doe', email: 'jdoe@aol.com')
    end

    it 'has a form with duration, date, and time fields, and all existing users with checkboxes to be connected to the party',
       :vcr do
      visit user_discover_path(@user)

      click_button 'Discover Top Rated Movies'

      click_on 'The Godfather'

      click_button 'Create Viewing Party for The Godfather'

      expect(current_path).to eq("/users/#{@user.id}/movies/238/viewing_party/new")

      expect(page).to have_field('Duration')
      expect(page).to have_field('When')
      expect(page).to have_field('Start Time')
      expect(page).to have_field("guests_#{@user2.id}")
      expect(page).to have_button('Create Party')

      within('#users') do
        expect(page).to have_content(@user2.name)
      end

      fill_in 'Duration', with: 190
      fill_in 'When', with: '12/10/2023'
      fill_in 'Start Time', with: '6:30 PM'
      check("guests_#{@user2.id}")
      click_button 'Create Party'

      expect(current_path).to eq("/users/#{@user.id}")
    end

    it 'does not fill in params for viewing party',
       :vcr do
      visit user_discover_path(@user)

      click_button 'Discover Top Rated Movies'

      click_on 'The Godfather'

      click_button 'Create Viewing Party for The Godfather'

      expect(current_path).to eq("/users/#{@user.id}/movies/238/viewing_party/new")

      expect(page).to have_field('Duration')
      expect(page).to have_field('When')
      expect(page).to have_field('Start Time')
      expect(page).to have_field("guests_#{@user2.id}")
      expect(page).to have_button('Create Party')

      within('#users') do
        expect(page).to have_content(@user2.name)
      end

      click_button 'Create Party'

      expect(current_path).to eq("/users/#{@user.id}/movies/238/viewing_party/new")
      expect(page).to have_content("Duration, Start Time, and Date are required fields")


    end

    it 'does not add guests to the party',
        :vcr do

      visit user_discover_path(@user)

      click_button 'Discover Top Rated Movies'

      click_on 'The Godfather'

      click_button 'Create Viewing Party for The Godfather'

      expect(current_path).to eq("/users/#{@user.id}/movies/238/viewing_party/new")

      expect(page).to have_field('Duration')
      expect(page).to have_field('When')
      expect(page).to have_field('Start Time')
      expect(page).to have_field("guests_#{@user2.id}")
      expect(page).to have_button('Create Party')

      within('#users') do
        expect(page).to have_content(@user2.name)
      end

      fill_in 'Duration', with: 190
      fill_in 'When', with: '12/10/2023'
      fill_in 'Start Time', with: '6:30 PM'
      click_button 'Create Party'

      expect(current_path).to eq("/users/#{@user.id}/movies/238/viewing_party/new")
      expect(page).to have_content("Add guests to the party")
    end
  end
end
