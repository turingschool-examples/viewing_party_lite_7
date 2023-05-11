require 'rails_helper'

RSpec.describe Review do
  before(:each) do
    test_review
    @review = Review.new(@data)
  end
  describe "initialize" do
    it "exists and has attributes" do
      expect(@review).to be_a Review
      expect(@review.author).to eq("Goddard")
      expect(@review.content).to eq("Pretty awesome movie. It shows what one crazy person can convince other crazy people to do. Everyone needs something to believe in. I recommend Jesus Christ, but they want Tyler Durden.")
    end
  end
end