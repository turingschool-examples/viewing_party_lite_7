require 'rails_helper' 

describe 'Movie Details Page' do
  before :each do
    test_data

    popular_movies_fixture = File.read("spec/fixtures/popular_movies.json")
    stub_request(:get, "https://api.themoviedb.org/3/movie/popular").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12',
          'X-Api-Key'=>ENV["API_KEY"]
           }).
         to_return(status: 200, body: popular_movies_fixture, headers: {})
    
    visit user_discover_index_path(@user1)
    click_button "Search by Movie Title"
    click_link "The Creator"
  end

describe '#method_name' do
  it 'does stuff' do
    # expect().to eq()
  end
end

end