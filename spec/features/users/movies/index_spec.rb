require 'rails_helper'

RSpec.describe 'users movies results page', type: :feature do
  before(:all) do
    @user1 = create(:user)
    @user2 = create(:user)
  end

  describe 'discover page button', :vcr do
    it 'displays the Discover Page button' do
      visit "/users/#{@user1[:id]}/movies?q=''"
      expect(page).to have_button('Discover Page')

      click_button 'Discover Page'

      expect(current_path).to eq(user_discover_index_path(@user1))
    end
  end

  describe 'invalid search', :vcr do
    it 'returns alert if a search was invalid' do
      visit "/users/#{@user1[:id]}/movies?q='asldkgjawof'"

      expect(page).to have_content('No movies found.')
    end
  end

  describe 'top rated movies', :vcr do
    it 'returns top rated movies' do
      visit "/users/#{@user1[:id]}/movies?q=top%20rated"
      movies = MovieFacade.new.top_rated

      movies.each do |movie|
        within("##{movie.id}") do
          expect(page).to have_content(movie.title)
          expect(page).to have_content(movie.vote_average)
        end
      end
    end
  end

  describe 'searched movies', :vcr do
    it 'returns searched movies' do
      visit "/users/#{@user1[:id]}/movies?q=princess"
      movies = MovieFacade.new.search('princess')

      movies.each do |movie|
        within("##{movie.id}") do
          expect(page).to have_content(movie.title)
          expect(page).to have_content(movie.vote_average)
        end
      end
    end
  end
end
