# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users show page', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Scott DeVoss', email: 'scottd@gmail.com')
    @user2 = User.create!(name: 'Cory Powell', email: 'coryp@yahoo.com')
    visit "/users/#{@user1.id}/discover"
  end

  describe "When I visit '/users/:id/discover'" do
    it 'should show a button to Discover Top Rated Movies that when clicked routes to 
    movie results page' do
      expect(page).to have_button('Find Top Rated Movies')
      click_button('Find Top Rated Movies')
      expect(current_path).to eq("/users/#{@user1.id}/movies")
    end

    it 'have a text field to enter keyword(s) to search by movie title and a button to search by
    movie title and when clicked routes to movie results page ' do
      expect(page).to have_field('search')
      expect(page).to have_button('Search by Movie Title')
      fill_in 'search', with: 'terminator'
      click_button('Search by Movie Title')
      expect(current_path).to eq("/users/#{@user1.id}/movies")
    end
  end
end
