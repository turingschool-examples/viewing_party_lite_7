require "rails_helper"

RSpec.describe MovieReview do
  it "exists" do
    attrs = {
      author: "loverofBpitt",
      content: "Pitt plays his character like an affable golden retriever that has swallowed a self-help manual.",
    }

    review = MovieReview.new(attrs)

    expect(review).to be_a MovieReview
    expect(review.author).to eq("loverofBpitt")
    expect(review.content).to eq("Pitt plays his character like an affable golden retriever that has swallowed a self-help manual.")
  end
end