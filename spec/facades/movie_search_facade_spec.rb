require 'rails_helper'

describe MovieSearchFacade do
  context "class methods" do
    context "#movie_search" do
      before :each do
        oppenheimer_test_data
        @facade = MovieSearchFacade.new("Trolls")
      end

      it "exists" do
        expect(@facade.class).to be(MovieSearchFacade)
      end

      it "can create poros of movies based on search terms" do
        @facade.movies.each do |movie|
          expect(movie).to be_a(Movie)
          expect(movie).to respond_to(:title)
          expect(movie).to respond_to(:vote_average)
          expect(movie).to respond_to(:id)
        end
      end
    end
  end
end