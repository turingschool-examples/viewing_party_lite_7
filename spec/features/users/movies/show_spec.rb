RSpec.describe 'Discover Movies Page' do
  before(:each) do
    load_test_data
  end

  it 'redirects to discover page when "Discover Movies" button is clicked' do
    visit user_path(@user1)
    click_button 'Discover Movies'

    expect(current_path).to eq(user_discover_index_path(@user1))
  end

  it 'displays "Discover Top Rated Movies" and "Search by Movie Title" buttons on discover page' do
    visit user_discover_index_path(@user1)
    expect(page).to have_button('Discover Top Rated Movies')
    expect(page).to have_button('Search by Movie Title')
  end

  it 'redirects to movie results page when "Search by Movie Title" button is clicked' do
    batman_movie_response = File.read('spec/fixtures/batman_movies.json')

    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{Rails.application.credentials.tmdb[:key]}&query=Batman")
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Faraday v2.7.12'
        }
      )
      .to_return(status: 200, body: batman_movie_response, headers: {})
    visit user_discover_index_path(@user1)

    fill_in 'Movie_Title', with: 'Batman'
    click_button 'Search by Movie Title'

    expect(current_path).to eq(user_movies_path(@user1))
  end

  it 'redirects to movie results page when "Discover Top Rated Movies" button is clicked' do
    popular_movie_response = File.read('spec/fixtures/batman_movies.json')

    stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key=#{Rails.application.credentials.tmdb[:key]}")
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Faraday v2.7.12'
        }
      )
      .to_return(status: 200, body: popular_movie_response, headers: {})

    visit user_discover_index_path(@user1)

    click_button 'Discover Top Rated Movies'

    expect(current_path).to eq(user_movies_path(@user1))
  end
end
