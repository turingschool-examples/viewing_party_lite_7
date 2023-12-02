require "rails_helper"

RSpec.describe MovieReview do
  before :each do
    attrs = {
      author: "loverofBpitt",
      content: "Pitt plays his character like an affable golden retriever that has swallowed a self-help manual.",
      author_details: 
                  {
                  name: "Brad Pitt",
                  username: "loverofBpitt",
                  avatar_path: "/picture_of_brad",
                  rating: 10
            }}

    @review = MovieReview.new(attrs)
  end

  describe "movie review object" do
    it "exists" do
      expect(@review).to be_a MovieReview
      expect(@review.author).to eq("loverofBpitt")
      expect(@review.content).to eq("Pitt plays his character like an affable golden retriever that has swallowed a self-help manual.")
      expect(@review.name).to eq("Brad Pitt")
      expect(@review.username).to eq("loverofBpitt")
      expect(@review.avatar_path).to eq("/picture_of_brad")
      expect(@review.rating).to eq(10)
    end
  end
end