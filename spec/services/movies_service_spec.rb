require "rails_helper"

RSpec.describe MoviesService do
  # set up VCR?
  xit "can connect to movie db" do
    response = MoviesService.new.connection

    # expect(response).to be_successful
  end

  it "can retrieve top 20 movies" do
    movies = MoviesService.new.top_rated 
    
    expect(movies).to be_an(Array)
    expect(movies.count).to eq(20)
  end

  it "can search for movies by keyword in title" do

  end

  it "can generate a poro for a specific movie" do
    movie = MoviesService.new.find_movie(234)
    
  end
end