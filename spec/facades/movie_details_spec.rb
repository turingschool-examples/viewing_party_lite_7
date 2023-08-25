require 'rails_helper'

describe MovieDetailsFacade do
  before do
    @movie = MovieFacade.top_rated_movies[0]
  end
  context "instance methods" do
    it "returns movie details", :vcr do
        expect(MovieDetailsFacade.movie_details(@movie.id)).to be_a MovieDetails
    end

    it "returns cast of a movie", :vcr do
      MovieDetailsFacade.movie_cast(@movie.id).each do |cast_member|
      expect(cast_member).to be_a MovieCast
      end
    end

    it "can count the cast of a movie", :vcr do
      expect(MovieDetailsFacade.movie_cast(@movie.id).count).to eq(59)
    end

    it "returns movie reviews", :vcr do
      MovieDetailsFacade.movie_reviews(@movie.id).each do |review|
        expect(review).to be_a MovieReview
      end
    end

    it "can count movie reviews", :vcr do
      expect(MovieDetailsFacade.movie_reviews(@movie.id).count).to eq(5)
    end
  end
end