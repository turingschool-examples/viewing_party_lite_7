require 'rails_helper'

describe MovieReviewService do
  before :each do
    oppenheimer_test_data
  end

  context "movie_reviews" do
    it "can return a list of movie reviews" do
      reviews = MovieReviewService.new.movie_reviews(872585)
      review = reviews[:results].first
      expect(reviews).to be_a Hash

      expect(review).to have_key :author
      expect(review[:author]).to be_a String

      expect(review).to have_key :content
      expect(review[:content]).to be_a String
    end
  end
end