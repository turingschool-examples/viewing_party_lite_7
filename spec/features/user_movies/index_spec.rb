require 'rails_helper'

RSpec.describe 'user movies page' do
  before(:each) do
    @user_1 = create(:user)
    @party1 = create(:viewing_party)
    @party2 = create(:viewing_party)
    create(:user_party, user: @user_1, viewing_party: @party1, host: false)
    create(:user_party, user: @user_1, viewing_party: @party2, host: true)

    top_20_response = File.read('spec/fixtures/top_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: top_20_response)

    search_results = File.read('spec/fixtures/godfather_search.json')
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?query=Godfather&api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: search_results)

    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_DB_KEY']}&query=")
      .to_return(status: 200, body: '{"results": []}')
    
    movie_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: movie_response)

    actor_response = File.read('spec/fixtures/actors.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/credits?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: actor_response)
    
  end
  it 'has a button to take you back to discover page' do
    visit "/users/#{@user_1.id}/movies?q=top_rated"

    click_link 'Back'

    expect(current_path).to eq("/users/#{@user_1.id}/discover")

    visit "/users/#{@user_1.id}/movies?search=Godfather"

    click_link 'Back'

    expect(current_path).to eq("/users/#{@user_1.id}/discover")
  end

  it 'displays the top rated movies' do
    visit "/users/#{@user_1.id}/movies?q=top_rated"

    within "#top_rated-1" do
      expect(page).to have_link('The Godfather')
      expect(page).to have_content(8.7)
    end

    within "#top_rated-2" do
      expect(page).to have_link('The Shawshank Redemption')
      expect(page).to have_content('8.7')
    end

    within "#top_rated-20" do
      expect(page).to have_link('Teen Wolf: The Movie')
      expect(page).to have_content('8.5')
    end

    expect(page).to_not have_content('Tokyo Godfathers')
  end

  it 'the movie title link takes you to a display page for that movie' do
    visit "/users/#{@user_1.id}/movies?q=top_rated"
    
    within "#top_rated-1" do
      click_link 'The Godfather'

      expect(current_path).to eq("/users/#{@user_1.id}/movies/238")
    end

  end

  it 'displays the search results' do
    visit "/users/#{@user_1.id}/movies?search=Godfather"
    
    within "#search_results-1" do
      expect(page).to have_link('Godfather')
      expect(page).to have_content('8.0')
    end

    within "#search_results-3" do
      expect(page).to have_link('Tokyo Godfathers')
      expect(page).to have_content('7.879')
    end

    within "#search_results-8" do
      expect(page).to have_link('Onimasa: A Japanese Godfather')
      expect(page).to have_content('6.4')
    end

    expect(page).to_not have_content('Teen Wolf: The Movie')
  end
end