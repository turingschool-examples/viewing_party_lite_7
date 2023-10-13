require 'rails_helper'

RSpec.describe 'Discover Movies Page' do
  before :each do
    @u1 = User.create!(name: 'Brian', email: 'brian@brian.com')
    @u2 = User.create!(name: 'Lorien', email: 'lorienlorienl.com')
    @u3 = User.create!(name: 'Rachel', email: 'rachel@rachel.com')
    visit user_path(@u1)
  end
  it 'has a button to discover movies' do
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=d84e59db219943d545dafbf5f7631afa").
      to_return(status: 200, body: File.read("spec/features/fixtures/movie_results.json"), headers: {})  
    visit user_discover_index_path(@u1)

    within('#top_movies') do
      expect(page).to have_button('Discover Top Rated Movies')
      click_button 'Discover Top Rated Movies'
      expect(current_path).to eq user_movies_path(@u1)
    end 
  end

  it 'has a search field to search by movie title' do
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=d84e59db219943d545dafbf5f7631afa&query=Barbie").
      to_return(status: 200,body: File.read("spec/features/fixtures/search_movie_results.json"), headers: {})
  
    visit user_discover_index_path(@u1)
    
    within('#movie_search') do
      expect(page).to have_field('Search By Movie Title')
      fill_in 'Search By Movie Title', with: 'Barbie'
      click_button 'Search'
      expect(current_path).to eq user_movies_path(@u1)
    end
  end

end
