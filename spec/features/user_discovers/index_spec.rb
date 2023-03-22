
require 'rails_helper'

RSpec.describe 'user discover page' do
  before(:each) do
    @user_1 = create(:user)
    @party1 = create(:viewing_party)
    @party2 = create(:viewing_party)
    create(:user_party, user: @user_1, viewing_party: @party1, host: false)
    create(:user_party, user: @user_1, viewing_party: @party2, host: true)

    top_20_response = File.read('spec/fixtures/top_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: top_20_response)

    visit "/users/#{@user_1.id}/discover"
  end

  it 'displays the page title' do
    expect(page).to have_content('Discover Movies')
  end

  it 'it has a button to discover top rated movies' do
    expect(page).to have_button('Discover Top Rated Movies')

    click_button 'Discover Top Rated Movies'

    expect(current_path).to eq("/users/#{@user_1.id}/movies")
  end

  it 'works to find movies when a valid movie title is input in the search bar' do
    visit "/users/#{@user_1.id}/discover"

    within '#search_movies' do
      fill_in :search, with: 'Godfather'
      click_button('Find Movies')
      expect(current_path).to eq("/users/#{@user_1.id}/movies")
    end
  end

  # it 'has a search field that redirects back to itself if no input exists' do

  #   within '#search_movies' do
    
  #     expect(page).to have_field :search
  #     expect(page).to have_button('Find Movies')

  #     click_button('Find Movies')
  #     expect(current_path).to eq("/users/#{@user_1.id}/discover")
  #   end
  #   expect(page).to have_content('No Results Found')
  # end
end