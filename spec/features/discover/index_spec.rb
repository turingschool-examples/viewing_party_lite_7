require 'rails_helper'

RSpec.describe 'Discover Movies Page', type: :feature do 
  before(:each) do 
    @user_1 = create(:user)
    @user_2 = create(:user)
    visit user_path(@user_1)
  end
  
  describe 'Discover Movies Button' do 
    it "button to discover movies routes to user discover page" do 
      click_on 'Discover Movies'
      expect(current_path).to eq(user_discover_index_path(@user_1))
      expect(current_path).to eq("/users/#{@user_1.id}/discover")
    end
    
    it 'button to discover movies sad path' do 
      click_on 'Discover Movies'
      expect(current_path).to_not eq(user_discover_index_path(@user_2))
      expect(current_path).to_not eq("/users/#{@user_2.id}/discover")
    end
  end
  
  describe 'button to discover top rated movies' do 
    it 'has button' do 
      visit user_discover_index_path(@user_2)
      expect(page).to have_button('Discover Top Rated Movies')
    end

    it 'button has path' do 
      visit user_discover_index_path(@user_2)
      click_on 'Discover Top Rated Movies'
      expect(current_path).to eq(user_movies_path(@user_2))
    end
  end
  
  describe 'search field for movies' do 
    before(:each) do 
      visit user_discover_index_path(@user_2)
    end
    it 'has a search field' do 
      expect(page).to have_field('Search by Movie Title')
    end

    it 'has search button' do 
      expect(page).to have_button('Search')
    end

    it 'movie search by title' do 
      fill_in :movie_search, with: 'Neverending' 
      click_button 'Search' 
      expect(current_path).to eq(user_movies_path(@user_2))
    end
  end
end

# As an user,
# When I visit the '/users/:id/discover' path, where :id, is the id of a valid user,
# I should see

#  Button to Discover Top Rated Movies
#  A text field to enter keyword(s) to search by movie title
#  A Button to Search by Movie Title
# Details When the user clicks on the Top Rated Movies OR the search button, they should be taken to the movies results page (more details of this on the Movies Results Page issue.