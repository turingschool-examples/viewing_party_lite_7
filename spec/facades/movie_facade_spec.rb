require "rails_helper"

RSpec.describe MovieFacade do
  describe "#find_movies", :vcr do
    it "can find top rated movies" do
      top_movies = MovieFacade.new.find_movies

      expect(top_movies).to be_an(Array)

      top_movies.each do |top_movie|
        expect(top_movie).to be_a(Movie)
      end
    end

    it "can search movies by keyword" do
      movies_by_keyword = MovieFacade.new('Princess').find_movies

      expect(movies_by_keyword).to be_an(Array)

      movies_by_keyword.each do |keyword_movie|
        expect(keyword_movie).to be_a(Movie)
      end
    end
  end
end