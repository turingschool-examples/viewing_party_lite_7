require 'rails_helper'

RSpec.describe Review do
  it 'exists' do
    attrs = {
      author: "Joe Bob",
      content: "This movie was great!"
    }

    review = Review.new(attrs)

    expect(review).to be_a(Review)
    expect(review.author).to eq("Joe Bob")
    expect(review.content).to eq("This movie was great!")
  end
end