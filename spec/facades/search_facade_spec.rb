require 'rails_helper'

RSpec.describe SearchFacade, type: :facade do
  before(:each) do
    @search_facade = SearchFacade.new
  end

  describe "instance methods" do
    it "top_rated", :vcr do
      top_rated_movies = @search_facade.top_rated
      
      expect(top_rated_movies).not_to be_empty
      top_rated_movies.each do |movie|
        expect(movie).to be_a(Movie)
      end
    end

    it "search(keyword)", :vcr do
      searched = @search_facade.search("Bar")

      expect(searched).not_to be_empty
      searched.each do |movie|
        expect(movie).to be_a(Movie)
      end
    end

    it "find_movie(id)", :vcr do
      searched = @search_facade.find_movie(238)

      expect(searched).to be_a(Movie)
    end
  end
end