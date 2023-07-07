require 'rails_helper'

RSpec.describe 'Movie Details Page', type: :feature do
  describe "As a user, when I visit the Movie Details Page" do
    it 'displays button to create a viewing party and button to return to discover page' do
      user = User.create!(name: 'Sarah', email: 'sarah@gmail.com')
      movie = 

      visit movie_show_path 

      expect(page).to have_button("Create Viewing Party")
      expect(page).to have_button("Discover Page")
    end
  end
end