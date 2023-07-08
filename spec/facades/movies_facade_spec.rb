require "rails_helper"

RSpec.describe MovieFacade do
  describe "class methods", :vcr do
    it "can search movies" do
      movies_facade = MoviesFacade.new("The Dark Knight").movies
      expect(movies_facade).to be_an Array
      expect(movies_facade.first).to be_a Movie
      expect(movies_facade.first.id).to be_a Integer
      expect(movies_facade.count).to eq(20)
    end

    it "has top rated movies" do
      top_rated_movies_facade = MoviesFacade.new.movies
      expect(top_rated_movies_facade).to be_an Array
      expect(top_rated_movies_facade.first).to be_a Movie
      expect(top_rated_movies_facade.first.title).to be_a String
      expect(top_rated_movies_facade.first.id).to be_a Integer
      expect(top_rated_movies_facade.count).to eq(20)
    end
  end
end
