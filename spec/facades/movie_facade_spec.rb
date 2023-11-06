# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'initialize' do
    it 'exists' do
      facade = MovieFacade.new(100)

      expect(facade).to be_a MovieFacade
    end
  end

  describe '.movie_cast' do
    it 'returns an array of Cast objects', :vcr do
      cast_members = MovieFacade.movie_cast(100)

      expect(cast_members).to be_an Array
      expect(cast_members.first).to be_a Cast
    end
  end

  describe '.movie_reviews' do
    it 'returns an array of Review objects', :vcr do
      reviews = MovieFacade.movie_reviews(100)

      expect(reviews).to be_an Array
      expect(reviews.first).to be_a Review
    end
  end
end
