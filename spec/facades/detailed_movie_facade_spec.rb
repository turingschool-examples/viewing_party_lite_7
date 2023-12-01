require 'rails_helper'

describe DetailedMovieFacade do
  context "class methods" do
    context "#detailed_movie" do
      before :each do
        oppenheimer_test_data
        @movie = DetailedMovieFacade.new(872585)
      end

      it "exists" do
        expect(@movie.class).to be(DetailedMovieFacade)
      end

      it "can create a poro of a detailed movie" do
        detailed_movie = @movie.detailed_movie

        expect(detailed_movie).to be_a(DetailedMovie)
        expect(detailed_movie).to respond_to(:title)
        expect(detailed_movie).to respond_to(:vote_average)
        expect(detailed_movie).to respond_to(:id)
        expect(detailed_movie).to respond_to(:runtime)
        expect(detailed_movie).to respond_to(:genres)
        expect(detailed_movie).to respond_to(:summary)
      end
    end
  end
end