require 'rails_helper'

describe PopularMoviesFacade do
  context "class methods" do
    context "#popular_movies" do
      before :each do
        oppenheimer_test_data
        @facade = PopularMoviesFacade.new
      end

      it "exists" do
        expect(@facade.class).to be(PopularMoviesFacade)
      end

      it "can create poros of popular movies" do
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