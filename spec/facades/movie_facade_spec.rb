require 'rails_helper'

RSpec.describe MovieFacade do
  before(:each) do
    @mf = MovieFacade.new
  end
  describe "initialize" do
    it "exists" do
      expect(@mf).to be_a MovieFacade
    end
  end
  describe "find_movies" do
    it "returns a list of movies based on a search query", :vcr do
      movies = @mf.find_movies("fight")
      expect(movies).to all be_a Movie
      expect(movies.count <= 20).to be true
      results = movies.map do |movie|
        movie.title.downcase.include? "fight"
      end
      expect(results).to all be true
    end
  end
  describe "top_rated_movies" do
    it "returns a list of the top rated movies", :vcr do
      movies = @mf.top_rated_movies
      expect(movies).to all be_a Movie
      expect(movies.count <= 20).to be true
    end
  end
  describe "find_movie" do
    it "returns the movie with given id", :vcr do
      movie = @mf.find_movie(550)
      expect(movie).to be_a Movie
    end
  end
  describe "cast_members" do
    it "returns 10 cast members from movie with given id", :vcr do
      cast = @mf.cast_members(550)
      expect(cast).to all be_a CastMember
      expect(cast.count <= 10).to be true
    end
  end
  describe "all_reviews" do
    it "returns all reviews for movie with given id", :vcr do
      reviews = @mf.all_reviews(550)
      expect(reviews).to all be_a Review
    end
  end
  describe "review_count" do
    it "returns count of reviews for movie with given id", :vcr do
      expect(@mf.review_count(550)).to eq 8
    end
  end
end
