require "rails_helper"

RSpec.describe MovieFacade do
  describe "movie facades", :vcr do
    it "creates top rated movies objects" do
      movie_facade = MovieFacade.new
      movies = movie_facade.top_rated

      expect(movies).to be_an(Array)
      expect(movies.first).to be_a(Movie)
    end

    it "creates search results by id object" do
      movie_facade = MovieFacade.new
      movies = movie_facade.find_movie(238)

      expect(movies).to be_a(Movie)
    end

    it "creates review objects" do
      movie_facade = MovieFacade.new
      reviews = movie_facade.reviews(238)

      expect(reviews).to be_an(Array)
      expect(reviews.first).to be_a(Reviews)
    end

    it "creates cast objects" do
      movie_facade = MovieFacade.new
      cast = movie_facade.cast(238)

      expect(cast).to be_an(Array)
    end
  end
end