require 'rails_helper'

RSpec.describe MovieReview do
  describe "initialize" do
    it "has attributes" do
      movie_review_attributes = {
        author: "TestUsername",
        content: "Test content"
      }
      movie_review = MovieReview.new(movie_review_attributes)

      expect(movie_review.author).to eq(movie_review_attributes[:author])
      expect(movie_review.content).to eq(movie_review_attributes[:content])
    end
  end
end