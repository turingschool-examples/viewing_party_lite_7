# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review do
  it 'exists' do
    attrs = {
      author: 'Marlon Brando',
      content: 'This movie sucks'
    }

    review = Review.new(attrs)

    expect(review).to be_a(Review)
    expect(review.author).to eq('Marlon Brando')
    expect(review.content).to eq('This movie sucks')
  end
end
