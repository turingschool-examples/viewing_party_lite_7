require 'rails_helper'

RSpec.describe Review do
  describe 'initialize' do
    it 'creates a review object' do
      review_data = {
        author: 'Don Cheedle',
        content: 'This is movie really sucks'
      }

      review = Review.new(review_data)

      expect(review).to be_a(Review)
      expect(review.author).to eq('Don Cheedle')
      expect(review.content).to eq('This is movie really sucks')
    end
  end
end
