require "rails_helper"

RSpec.describe Review do
  it "exists" do
    review_data = {
      author: "futuretv"
    }

    review = Review.new(**review_data)

    expect(review).to be_a(Review)
    expect(review.author).to eq("futuretv")
  end
end