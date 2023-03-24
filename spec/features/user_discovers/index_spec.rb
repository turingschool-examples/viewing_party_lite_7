
require 'rails_helper'

RSpec.describe 'user discover page' do
  before(:each) do
    @user_1 = create(:user)
    @party1 = create(:viewing_party)
    @party2 = create(:viewing_party)
    create(:user_party, user: @user_1, viewing_party: @party1)
    create(:user_party, user: @user_1, viewing_party: @party2)

    top_20_response = File.read('spec/fixtures/top_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: top_20_response)
    
    search_results = File.read('spec/fixtures/godfather_search.json')
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?query=Godfather&api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: search_results)

    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_DB_KEY']}&query=")
      .to_return(status: 200, body: '{"results": []}')

    no_response = File.read('spec/fixtures/no_response.json')
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_DB_KEY']}&query=blahblahblah")
      .to_return(status: 404, body: no_response)
  end

  it 'displays the page title' do
    visit "/users/#{@user_1.id}/discover"

    expect(page).to have_content('Discover Movies')
  end

  it 'it has a button to discover top rated movies' do
    visit "/users/#{@user_1.id}/discover"

    expect(page).to have_button('Discover Top Rated Movies')

    within '#top_movies' do
      click_button 'Discover Top Rated Movies'

      expect(current_path).to eq("/users/#{@user_1.id}/movies")
    end
  end

  it 'works to find movies when a valid movie title is input in the search bar' do
    visit "/users/#{@user_1.id}/discover"

    within '#search_movies' do
      fill_in :search, with: 'Godfather'
      click_button('Find Movies')
      expect(current_path).to eq("/users/#{@user_1.id}/movies")
    end
  end

  it 'has a search field that redirects back to itself if no input exists' do

    visit "/users/#{@user_1.id}/discover"

    within '#search_movies' do
      fill_in :search, with: ''
      click_button('Find Movies')
      
      expect(current_path).to eq("/users/#{@user_1.id}/discover")
    end

    expect(page).to have_content('No Results Found')
  end

  it 'has a search field that redirects back to itself if the input is not found' do
    visit "/users/#{@user_1.id}/discover"

    within '#search_movies' do
      fill_in :search, with: 'blahblahblah'
      click_button('Find Movies')
      
      expect(current_path).to eq("/users/#{@user_1.id}/discover")
    end

    expect(page).to have_content('No Results Found')
  end
end