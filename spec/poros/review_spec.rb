require "rails_helper"


RSpec.describe "Review" do
  it "exists and has attributes" do
    attrs = {
      "author": "futuretv",
      "author_details": {
                "name": "",
                "username": "futuretv",
                "rating": 10.0
            }
      }

    review = Review.new(attrs)

    expect(review).to be_a Review

    expect(review.author).to eq("futuretv")
    expect(review.author_details).to eq({"name": "", "username": "futuretv", "rating": 10.0})
  end
end