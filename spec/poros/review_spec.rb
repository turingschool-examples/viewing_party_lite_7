# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review do
  it 'exists' do
    attrs = {
      content: 'Good movie',
      author: 'Dave',
      author_details: { rating: 8 }
    }

    review = Review.new(attrs, 3)

    expect(review).to be_a Review
    expect(review.content).to eq('Good movie')
    expect(review.author).to eq('Dave')
    expect(review.rating).to eq(8)
    expect(review.total_results).to eq(3)
  end
end
