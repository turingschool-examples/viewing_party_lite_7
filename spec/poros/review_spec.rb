require 'rails_helper'

RSpec.describe Review do
  describe 'initialize' do
    it 'exists and has attributes' do
      data = {author: 'Goddard', content: "Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden.", author_details: { rating: 9.0 } }
      review = Review.new(data)

      expect(review).to be_a(Review)
      expect(review.author).to eq(data[:author])
      expect(review.content).to eq(data[:content])
      expect(review.rating).to eq(data[:author_details][:rating])
    end
   
    it 'exists and has attributes' do
      data = {author: 'Brett Pascoe', content: "This is a movie review!", author_details: { rating: 7.0 } }
      review = Review.new(data)

      expect(review).to be_a(Review)
      expect(review.author).to eq(data[:author])
      expect(review.content).to eq(data[:content])
      expect(review.rating).to eq(data[:author_details][:rating])
    end
  end
end