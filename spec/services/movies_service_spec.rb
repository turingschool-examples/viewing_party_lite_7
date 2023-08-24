require 'rails_helper'

RSpec.describe MoviesService do
  describe 'instance methods' do
    it 'can connect to movie db', :vcr do
      service = MoviesService.new
      response = service.top_rated

      expect(response).to be_an(Array)
      expect(response.first).to have_key('title')
      expect(response.first).to have_key('vote_average')
      expect(response.first).to have_key('id')
    end
  end

  it 'can retrieve top 20 movies', :vcr do
    movies = MoviesService.new.top_rated

    expect(movies).to be_an(Array)
    expect(movies.count).to eq(20)
  end

  it 'can search for movies by keyword in title', :vcr do
    movies = MoviesService.new.search('Inception')

    expect(movies).to be_an(Array)
    expect(movies.first).to have_key('title')
  end

  it 'can generate a poro for a specific movie', :vcr do
    movie = MoviesService.new.find_movie(234)

    expect(movie).to be_a(Movie)
    expect(movie.title).to_not be_nil
  end
end
