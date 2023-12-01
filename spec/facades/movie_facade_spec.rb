require 'rails_helper'

RSpec.describe 'Movie Facade' do
  it 'top_rated', :vcr do
    results = MovieFacade.top_rated

    expect(results).to_not be_a(Hash)
    expect(results).to be_a(Array)

    movie_1 = results.first

    expect(movie_1).to respond_to(:backdrop_path)
    expect(movie_1.backdrop_path).to be_a(String)
    expect(movie_1).to respond_to(:genres)
    #expect(movie_1.genres).to be_a(Array)
    expect(movie_1).to respond_to(:id)
    expect(movie_1.id).to be_a(Integer)
    expect(movie_1).to respond_to(:overview)
    expect(movie_1.overview).to be_a(String)
    expect(movie_1).to respond_to(:popularity)
    expect(movie_1.popularity).to be_a(Float)
    expect(movie_1).to respond_to(:poster_path)
    expect(movie_1.poster_path).to be_a(String)
    expect(movie_1).to respond_to(:release_date)
    expect(movie_1.release_date).to be_a(String)
    expect(movie_1).to respond_to(:title)
    expect(movie_1.title).to be_a(String)
    expect(movie_1).to respond_to(:vote_average)
    expect(movie_1.vote_average).to be_a(Float)
    expect(movie_1).to respond_to(:vote_count)
    expect(movie_1.vote_count).to be_a(Integer)
  end

  it 'searched_movies', :vcr do
    results = MovieFacade.searched_movies("Django")

    expect(results).to_not be_a(Hash)
    expect(results).to be_a(Array)

    movie_1 = results.first

    expect(movie_1).to respond_to(:backdrop_path)
    expect(movie_1.backdrop_path).to be_a(String)
    expect(movie_1).to respond_to(:genres)
    #expect(movie_1.genres).to be_a(Array)
    expect(movie_1).to respond_to(:id)
    expect(movie_1.id).to be_a(Integer)
    expect(movie_1).to respond_to(:overview)
    expect(movie_1.overview).to be_a(String)
    expect(movie_1).to respond_to(:popularity)
    expect(movie_1.popularity).to be_a(Float)
    expect(movie_1).to respond_to(:poster_path)
    expect(movie_1.poster_path).to be_a(String)
    expect(movie_1).to respond_to(:release_date)
    expect(movie_1.release_date).to be_a(String)
    expect(movie_1).to respond_to(:title)
    expect(movie_1.title).to be_a(String)
    expect(movie_1).to respond_to(:vote_average)
    expect(movie_1.vote_average).to be_a(Float)
    expect(movie_1).to respond_to(:vote_count)
    expect(movie_1.vote_count).to be_a(Integer)
  end
end