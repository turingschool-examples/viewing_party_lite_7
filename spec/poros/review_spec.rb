require 'rails_helper'

RSpec.describe Review do
  before(:each) do
    @review = Review.new({
      author: 'Mark Twain', 
      rating: 8.9, 
      content: 'A little starvation, can really do more for the average sick man than can the best medicines and the best doctors'
    })
  end

  describe 'initialize' do 
    it 'exists and has attributes' do
      expect(@review).to be_a Review
      expect(@review.author).to eq('Mark Twain')
      expect(@review.rating).to eq(8.9)
      expect(@review.content).to eq('A little starvation, can really do more for the average sick man than can the best medicines and the best doctors')
    end
  end
end