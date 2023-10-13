require "rails_helper"

RSpec.describe Review do
  describe "initialize" do
    let(:data) do
      {
        author: "Myself",
        content: "This movie was great!",
        rating: 10
      }
    end

    it "creates a review object" do
      review = Review.new(data)
      
      expect(review).to be_a(Review)
      expect(review.author).to eq("Myself")
      expect(review.content).to eq("This movie was great!")
      expect(review.rating).to eq(10)
    end
  end
end