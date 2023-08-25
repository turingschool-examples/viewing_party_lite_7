require 'rails_helper'

RSpec.describe MovieReview do
  describe "initialize" do
    it "has attributes" do
      movie_review_attributes = {
        author: "TestUsername",
        name: "Test",
        username: "TestUsername",
        avatar_path: "test/path",
        rating: 123

      }
      movie_review = MovieReview.new(movie_review_attributes)

      expect(movie_review.author).to eq(movie_review_attributes[:author])
      expect(movie_review.name).to eq(movie_review_attributes[:name])
      expect(movie_review.username).to eq(movie_review_attributes[:username])
      expect(movie_review.avatar_path).to eq(movie_review_attributes[:avatar_path])
      expect(movie_review.rating).to eq(movie_review_attributes[:rating])
    end
  end
end