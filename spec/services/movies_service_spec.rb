require "rails_helper"

RSpec.describe MoviesService, :vcr do
  # set up VCR?
  xit "can connect to movie db" do
    response = MoviesService.new.connection

    # expect(response).to be_successful
  end

  xit "can retrieve top 20 movies" do
    movies = MoviesService.new.top_rated 
    
    expect(movies).to be_an(Array)
    expect(movies.count).to eq(20)
  end

  xit "can search for movies by keyword in title" do

  end

  it "can generate a poro for a specific movie" do
    movie = MoviesService.new.find_movie(234)
    expect(movie).to be_a(Movie)
    expect(movie.title).to be_a(String)
    expect(movie.id).to be_an(Integer)
    expect(movie.image).to be_a(String)
    expect(movie.vote_average).to be_a(Float)
    expect(movie.runtime).to be_an(Integer)
    expect(movie.genres).to be_an(Array)
    expect(movie.summary).to be_a(String)
    expect(movie.cast.first).to be_a(Hash)
    expect(movie.total_reviews).to be_an(Integer)
    expect(movie.reviews.first).to be_a(Hash)
  end
end