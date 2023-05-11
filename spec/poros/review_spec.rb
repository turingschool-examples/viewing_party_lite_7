require './app/poros/review.rb'

RSpec.describe Review do
  before(:all) do
    data = {content: "This movie was great",
            author: "Bob"
           }
    @review = Review.new(data)
  end
  it 'exists' do
    expect(@review).to be_a(Review)
  end

  it 'initializes with attributes' do
    expect(@review.content).to eq("This movie was great")
    expect(@review.author).to eq("Bob")
  end
end