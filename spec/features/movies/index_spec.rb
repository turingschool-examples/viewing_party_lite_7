require 'rails_helper'

RSpec.describe 'Movie Results Index (/users/:user_id/movies)' do
  context 'top movie results' do
    it 'displays the top movies, by vote average, limited to 20 results', :vcr do 
      user = User.last
      visit "/users/#{user.id}/discover"
      click_button 'Find Top Rated Movies'
      expect(current_path).to eq("/users/#{user.id}/movies")
      
    end
  end
end
