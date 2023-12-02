require 'rails_helper'

RSpec.describe 'Movie Results Page', type: :feature do
  before (:each) do
    @user1 = User.create!(name: 'Scott DeVoss', email: 'scottd@gmail.com')
    @user2 = User.create!(name: 'Cory Powell', email: 'coryp@yahoo.com')
  end

  describe "When I visit '/users/:id/discover'" do
    describe "And click on the 'Top Movies' or 'Search'" do
      it "I am taken to the movies results page where I see 'Title'(As a link to the Movie Details page - max 20)" do
        VCR.use_cassette('search_movie') do
          visit "/users/#{@user1.id}/discover"

          click_button 'Find Top Rated Movies'

          expect(current_path).to eq "/users/#{@user1.id}/movies"
          visit "/users/#{@user1.id}/discover"
          fill_in 'search', with: 'terminator'
          click_button 'Search by Movie Title'
          expect(current_path).to eq("/users/#{@user1.id}/movies")
        end
      end

      it "I see Titles as links to their movie details page I see the 'Vote Average of the movies'" do
        VCR.use_cassette('top_20_rated_movies') do
          visit "/users/#{@user1.id}/movies"

          within('#movie-238') do
            expect(page).to have_link('The Godfather')
            expect(page).to have_content('Vote Average: 8.7')
          end
          within('#movie-278') do
            expect(page).to have_link('The Shawshank Redemption')
            expect(page).to have_content('Vote Average: 8.705')
          end
          within('#movie-240') do
            expect(page).to have_link('The Godfather Part II')
            expect(page).to have_content('Vote Average: 8.589')
          end
        end
      end

      it 'should have a button to return to the Discover Page' do
        VCR.use_cassette('top_20_rated_movies') do
          visit "/users/#{@user1.id}/movies"

          expect(page).to have_button('Discover Page')

          click_button('Discover Page')

          expect(current_path).to eq("/users/#{@user1.id}/discover")
        end
      end
    end
  end
end
