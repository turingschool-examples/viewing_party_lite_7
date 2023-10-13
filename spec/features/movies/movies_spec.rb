require 'rails_helper'

RSpec.describe 'Movies Results Page', type: :feature do
  before :each do
    @u1 = User.create!(name: 'Brian', email: 'brian@brian.com')
    @u2 = User.create!(name: 'Lorien', email: 'lorien@lorien.com')
    @u3 = User.create!(name: 'Rachel', email: 'rachel@rachel.com')
    @movie1 = Movie.new(title: 'Movie Title 1', vote_average: 9.5, runtime: 100, api_id: 1)
  end

  it 'displays top-rated movie results and a return button' do
    visit user_path(@u1)
        
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=d84e59db219943d545dafbf5f7631afa").
      to_return(status: 200, body: File.read("spec/features/fixtures/movie_results.json"), headers: {})

    click_button 'Discover Movies'

    expect(page).to have_current_path(user_discover_index_path(@u1.id))

    click_button 'Discover Top Rated Movies'

    expect(current_path).to eq(user_movies_path(@u1.id))

    expect(page).to have_link('Return to Discover Page', href: user_discover_index_path(user_id: @u1.id))
  end

  it "can search for movies by title and have a return button" do
    visit user_path(@u1)
        
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=d84e59db219943d545dafbf5f7631afa&query=Barbie").
      to_return(status: 200, body: File.read("spec/features/fixtures/search_movie_results.json"), headers: {})

    click_button 'Discover Movies'

    expect(page).to have_current_path(user_discover_index_path(@u1.id))

    fill_in 'Search By Movie Title', with: 'Barbie'
    click_button 'Search'

    expect(current_path).to eq(user_movies_path(@u1.id))
    expect(page).to have_content('Barbie')
    expect(page).to have_content('Vote Average')
    expect(page).to have_content('7.3')
    expect(page).to have_link('Return to Discover Page', href: user_discover_index_path(user_id: @u1.id))
    
  end
end
