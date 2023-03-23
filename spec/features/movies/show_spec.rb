require 'rails_helper'

RSpec.describe 'movies show page' do
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
    @movie = Movie.new(JSON.parse(movie_response, symbolize_names: true))
  end

  it 'has a back button' do
    visit "/users/#{@user_1.id}/movies/#{@movie.id}"

    expect(page).to have_link('Back')
  end

  it 'has a button to create a viewing party' do
    visit "/users/#{@user_1.id}/movies/#{@movie.id}"

    expect(page).to have_button('Create Viewing Party')
  end

  it 'has the movie attributes' do
    visit "/users/#{@user_1.id}/movies/#{@movie.id}"

    expect(page).to have_content("Title: #{@movie.title}")
    expect(page).to have_content("Vote Average: #{@movie.vote_average}")
    expect(page).to have_content("Run Time: #{@movie.runtime}")
    expect(page).to have_content("Summary: #{@movie.summary}")
    expect(page).to have_content("Drama")
    expect(page).to have_content("Crime")
  end

  it 'has the first 10 actors in the cast' do
    visit "/users/#{@user_1.id}/movies/#{@movie.id}"

  end
end