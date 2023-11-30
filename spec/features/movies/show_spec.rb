require 'rails_helper'

RSpec.describe 'Movie Details Page', type: :feature do
  before(:each) do
    @user = User.create!(name: 'Morgan', email: 'morgan@email.com')
  end

  describe "When I visit a movie's details page '/users/:user_id/movies/:id'" do
    it 'I can see a button to return to the discover page' do
      VCR.use_cassette('dune_details') do
        visit "/users/#{@user.id}/movies/438631"

        expect(page).to have_button('Discover Movies')
        click_button 'Discover Movies'
        expect(current_path).to eq("/users/#{@user.id}/discover")
      end
    end
  end

end