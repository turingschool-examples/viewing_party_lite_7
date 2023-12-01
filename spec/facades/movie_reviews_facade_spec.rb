require 'rails_helper'

describe MovieReviewsFacade do
  context "class methods" do
    context "#movie_reviews" do
      before :each do
        oppenheimer_test_data
        @test_reviews = MovieReviewsFacade.new(872585)
      end

      it "exists" do
        expect(@test_reviews.class).to be(MovieReviewsFacade)
      end

      it "can create an array of poros of the movie reviews" do
        expect(@test_reviews.movie_reviews.class).to eq(Array)
        
        movie_review_test = @test_reviews.movie_reviews.first
        expect(movie_review_test).to be_a(MovieReview)
        expect(movie_review_test).to respond_to(:author)
        expect(movie_review_test).to respond_to(:content)
      end
    end
  end
end