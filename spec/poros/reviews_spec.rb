require "rails_helper"

RSpec.describe Reviews do
  describe "reviews class" do
    it "exists and has attributes" do
      data = { author: "Travis Bell",
                author_details: { rating: 8.0 },
                content: "This movie was great!"
              }
      review = Reviews.new(data)
      
      expect(review).to be_a(Reviews)
      expect(review.author).to eq("Travis Bell")
      expect(review.rating).to eq(8.0)
      expect(review.content).to eq("This movie was great!")
    end
  end
end