require 'rails_helper'

RSpec.describe 'Movie Results Page' do
  before(:each) do
    @user1 = User.create!(name: 'Wolfie', email: 'wolfie@gmail.com')
    top_rated_response = File.read('spec/fixtures/discover_top_rated_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['TMDB-KEY']}&include_adult=false&page=1&sort_by=popularity.desc")
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Faraday v2.7.9'
        }
      )
      .to_return(status: 200, body: top_rated_response, headers: {})

    keyword_response = File.read('spec/fixtures/keyword_movie_jaws2.json')
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB-KEY']}&include_adult=false&page=1&query=Jaws%202").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.9'
           })
      .to_return(status: 200, body: keyword_response, headers: {})

    keyword_responsej2 = File.read('spec/fixtures/keyword_movie_jaws.json')
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB-KEY']}&include_adult=false&page=1&query=Jaws")
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Faraday v2.7.9'
        }
      )
      .to_return(status: 200, body: keyword_responsej2, headers: {})

      movie_detailsj2 = File.read('spec/fixtures/movie_details_jaws2.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/579?api_key=#{ENV['TMDB-KEY']}&append_to_response=credits,reviews,images").
      with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Faraday v2.7.9'
        }).
      to_return(status: 200, body: movie_detailsj2, headers: {})
  

    visit "/users/#{@user1.id}/discover"
  end
  describe 'US9 it displays keyword search results' do
    it 'displays search results for a keyword/title search' do
      visit "/users/#{@user1.id}/discover"
      fill_in 'keyword', with: 'Jaws'
      click_button 'Search'
      # save_and_open_page
      expect(current_path).to eq("/users/#{@user1.id}/movies")
      expect(page.status_code).to eq 200
      expect(page).to have_link('Jaws 2')
      click_link("Jaws 2")
      expect(current_path).to eq("/users/#{@user1.id}/movies/579")
    end

    xit 'has a button to return to the discover page' do
      visit "/users/#{@user1.id}/movies"
      click_button 'Discover Movies'
      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end

    # more work on stubbing to figure out this link:
    # it "has title links to each movies details (show) page" do
    #   visit "/users/#{@user1.id}/discover"
    #   fill_in "keyword", with: "Jaws"
    #   click_button "Search"
    #   expect(current_path).to eq("/users/#{@user1.id}/movies")
    #   click_link "Santa Jaws"
    #   expect(current_path).to eq("")
    # end
  end
end
