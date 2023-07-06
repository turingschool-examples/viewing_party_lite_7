require 'rails_helper' 

RSpec.describe 'movies results page' do 
  before(:each) do 
    @user_1 = create(:user)
  end

  describe 'visiting movies results page' do 
    it 'top movies button goes to results page'

    it 'movies results page lists top movies if top movies button clicked'

    it 'movies results page lists relevant movies if search button clicked' 
  end

  describe 'movies results page content' do 
    it 'title of movie is link to movie details page'

    it 'vote average of movie is listed below movie title'

    it 'only lists 20 results on page' 

    it 'has a button to return to Discover page' 
  end
end