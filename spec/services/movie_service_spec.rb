require "rails_helper"

RSpec.describe MovieService do
  before(:each) do
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}")
      .to_return(status: 200, body: File.read("./spec/fixtures/top_rated_movies.json"))

    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&query=The%20Fellowship%20of%20the%20ring")
      .to_return(status: 200, body: File.read("./spec/fixtures/search_movie.json"))
  end

  describe "class methods" do
    it "top_rated_movies" do
      @response = MovieService.top_rated_movies
      @movies = @response[:results]

      expect(@movies).to be_a Array
      expect(@movies.count).to eq(20)
      expect(@movies.first[:title]).to eq("The Godfather")
    end

    it "movie_search" do
      @response = MovieService.movie_search("The Fellowship of the ring")
      @movies = @response[:results]

      expect(@movies).to be_a(Array)
      expect(@movies.first[:title]).to eq("The Lord of the Rings: The Fellowship of the Ring")
    end
  end
end
