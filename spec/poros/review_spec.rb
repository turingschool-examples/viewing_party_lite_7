require 'rails_helper'

RSpec.describe Review do 
  it 'exists' do 
    review = Review.new({author: 'CinemaSerf', content: 'Inevitable awards are on the way for the brightly colored production'})
    expect(review).to be_a(Review)
    expect(review).to respond_to(:author)
    expect(review).to respond_to(:content)
  end
end