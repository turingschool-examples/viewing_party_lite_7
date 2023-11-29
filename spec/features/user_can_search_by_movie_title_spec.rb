require 'rails_helper'

RSpec.describe 'user can search for movie by movie title', type: :feature do
  before(:each) do
    @user = create(:user)
  end

  it 'Allows user to search by title', :vcr do
    # json_response = File.read('spec/fixtures/search_by_movie_title_star_wars.json')

    # stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=d6e55850c9454bdba00520c7a05b8b40&query=Star%20Wars").
    # with(
    #   headers: {
    #   'Accept'=>'*/*',
    #   'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #   'User-Agent'=>'Faraday v2.7.12'
    #   }).
    # to_return(status: 200, body: json_response, headers: {})


    visit user_discover_index_path(@user)

    fill_in :query, with: 'Star Wars'
    click_button 'Search'

    expect(page.status_code).to eq(200)

    expect(current_path).to eq(user_movies_path(@user))
    expect(page).to have_content('Star Wars')
  end
end