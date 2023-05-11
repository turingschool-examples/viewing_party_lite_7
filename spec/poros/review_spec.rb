require 'rails_helper'

RSpec.describe Review do
  it 'exists and has attributes' do
    data = {
            author: 'John Doe',
            content: 'Some content.'
          }
    review = Review.new(data)

    expect(review).to be_a(Review)
    expect(review.author).to be_a(String)
    expect(review.content).to be_a(String)

    expect(review.author).to eq('John Doe')
    expect(review.content).to eq('Some content.')
  end
end