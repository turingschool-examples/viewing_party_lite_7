require 'rails_helper'
RSpec.describe Review do
  before(:each) do
    @review_data = {
      author: "John Smith",
      content: "Best Movie Ever!!"
    }
    @review = Review.new(@review_data)
  end

  describe "initialize" do
    it "should initialize the review data" do
      expect(@review).to be_a(Review)
      expect(@review.author).to eq("John Smith")
      expect(@review.content).to eq("Best Movie Ever!!")
    end
  end
end 