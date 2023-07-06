require 'rails_helper' 

RSpec.describe 'movies results page' do 
  before(:each) do 
    @user_1 = create(:user)
  end

  describe 'visiting movies results page' do 
    before(:each) do 
      visit user_discover_index_path(@user_1)
    end

    it 'top movies button goes to results page' do 
      click_on 'Discover Top Rated Movies'
      expect(current_path).to eq(user_movies_path(@user_1))
    end

    it 'movies results page lists top movies if top movies button clicked'

    it 'movies results page lists relevant movies if search button clicked' 
  end

  describe 'movies results page content' do 
    before(:each) do 
      visit user_movies_path(@user_1)
    end

    it 'title of movie is link to movie details page'

    it 'vote average of movie is listed below movie title'

    it 'only lists 20 results on page' 

    it 'has a button to return to Discover page' do 
      expect(page).to have_button('Discover Page')
      click_button 'Discover Page'
      expect(current_path).to eq(user_discover_index_path(@user_1))
    end
  end
end