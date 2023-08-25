require 'rails_helper'

describe MovieFacade do
  context "instance methods" do
    it "returns top_rated movies", :vcr do
      MovieFacade.top_rated_movies.each do |movie|
        expect(movie).to be_a Movie
      end
    end

    it "can count top_rated movies", :vcr do
      expect(MovieFacade.top_rated_movies.count).to eq(20)
    end

    it "returns searched movies", :vcr do
      MovieFacade.search_movies("Nemo").each do |movie|
        expect(movie).to be_a Movie
      end
    end

    it "can count searched movies", :vcr do
      expect(MovieFacade.search_movies("Nemo").count).to eq(20)
    end
  end
end