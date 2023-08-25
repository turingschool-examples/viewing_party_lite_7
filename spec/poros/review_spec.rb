# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review do
  describe 'creates review object' do
    it 'initializes with attributes' do
      review = Review.new({ author: 'Travis Bell',
                            content: 'This movie sucked!' })

      expect(review).to be_a Review
      expect(review.author).to be_a String
      expect(review.author).to eq('Travis Bell')
      expect(review.content).to be_a String
      expect(review.content).to eq('This movie sucked!')
    end
  end
end
