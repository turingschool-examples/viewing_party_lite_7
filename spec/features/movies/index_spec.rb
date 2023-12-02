require 'rails_helper'

RSpec.describe 'Movie Results Index (/users/:user_id/movies)' do
  context 'top movie results' do
    it 'displays the top movies, by vote average, limited to 20 results', :vcr do
      kam = User.create!(name: "Kam", email: "doofus23@gmail.com")
      visit "/users/#{kam.id}/discover"
      click_button 'Find Top Rated Movies'
      expect(current_path).to eq("/users/#{kam.id}/movies")
      expect(page).to have_button('Discover Page')
      expect(page).to have_link("Leo")
      expect(page).to have_content("Vote Average: 7.7")
    end
  end
  context 'search movie by title results' do
    it 'displays the top movies, by vote average, limited to 20 results', :vcr do
      kam = User.create!(name: "Kam", email: "doofus23@gmail.com")
      visit "/users/#{kam.id}/discover"
      fill_in :query, with: 'Barbie'
      click_button 'Find Movies'
      expect(page).to have_button('Discover Page')
      expect(page).to have_link("Barbie")
      expect(page).to have_content("Vote Average: 7.2")
    end
  end
end
