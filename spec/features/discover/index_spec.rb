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
  
  describe 'page has button to discover top rated movies' do 
    it 'has button' do 
      visit user_path(@user_2)
      expect(page).to have_button('Discover Top Rated Movies', href: "/users/#{@user_2.id}/movies")
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