require 'rails_helper'

RSpec.describe MoviesService, type: :service do
  describe "instance methods", :vcr do
    it "conn" do
      connection = MoviesService.new.conn

      expect(connection).to be_a(Faraday::Connection)
    end

    it "get_url(link)" do  
      fetched_url = MoviesService.new.get_url("movie/top_rated")
      
      expect(fetched_url).to be_a Hash
    end

    it "top_20" do
      top_20_movies = MoviesService.new.top_20

      expect(top_20_movies).to be_a Hash
    end

    it "movie_search(keyword)" do
      searched = MoviesService.new.movie_search("Bar")

      expect(searched).to be_a Hash
    end

    it "find(id)" do
      found_movie = MoviesService.new.find(238)

      expect(found_movie).to be_a Hash
    end

    it "cast(id)" do
      cast_of_movie = MoviesService.new.cast(238)

      expect(cast_of_movie).to be_a Hash
    end

    it "reviews(id)" do
      reviews_of_movie = MoviesService.new.reviews(238)

      expect(reviews_of_movie).to be_a Hash
    end
  end
end
