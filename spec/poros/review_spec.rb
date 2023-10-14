require 'rails_helper'

RSpec.describe Review do
  describe 'initialize' do
    it 'sets attributes correctly' do
      data = {
        author: 'John Doe',
        author_details: { username: 'johndoe123' },
        content: 'A great movie!',
      }
      review = Review.new(data)

      expect(review.author).to eq('John Doe')
      expect(review.username).to eq('johndoe123')
      expect(review.content).to eq('A great movie!')
    end
  end

  describe 'from_api_response' do
    it 'creates an array of reviews from API response' do
      response_data = {
        'results' => [
          {
            author: 'User1',
            author_details: { username: 'user1' },
            content: 'Review 1',
          },
          {
            author: 'User2',
            author_details: { username: 'user2' },
            content: 'Review 2',
          },
        ],
      }

      reviews = Review.from_api_response(response_data)

      expect(reviews).to be_an(Array)
      expect(reviews.size).to eq(2)
      expect(reviews[0]).to be_a(Review)
      expect(reviews[0].author).to eq('User1')
      expect(reviews[1]).to be_a(Review)
      expect(reviews[1].content).to eq('Review 2')
    end

    it 'handles empty API response' do
      response_data = { 'results' => [] }

      reviews = Review.from_api_response(response_data)

      expect(reviews).to be_an(Array)
      expect(reviews).to be_empty
    end
  end
end
