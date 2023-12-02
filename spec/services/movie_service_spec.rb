require 'rails_helper'

RSpec.describe MovieService do
  describe '#movie_details' do
    it 'returns movie details' do
      VCR.use_cassette('dune_details') do
        details = MovieService.new.movie_details(438631)
        expect(details).to be_a Hash
        expect(details).to have_key :title
        expect(details[:title]).to be_a String
        expect(details).to have_key :vote_average
        expect(details[:vote_average]).to be_a Float
      end
    end
  end

  describe '#get_credits' do
    it 'returns movie credits' do
      VCR.use_cassette('dune_credits') do
        credits = MovieService.new.get_credits(438631)
        expect(credits).to be_a Hash
        expect(credits).to have_key :cast
        expect(credits[:cast]).to be_an Array
        expect(credits[:cast].first).to have_key :name
        expect(credits[:cast].first[:name]).to be_a String
      end
    end
  end

  describe '#get_reviews' do
    it 'returns movie reviews' do
      VCR.use_cassette('dune_reviews') do
        reviews = MovieService.new.get_reviews(438631)
        expect(reviews).to be_a Hash
        expect(reviews).to have_key :results
        expect(reviews[:results]).to be_an Array
        expect(reviews[:results].first).to have_key :author
        expect(reviews[:results].first[:author]).to be_a String
        expect(reviews[:results].first).to have_key :content
        expect(reviews[:results].first[:content]).to be_a String
      end
    end
  end

  describe `#movie_images` do
    it 'gets an image' do
      VCR.use_cassette('dune_images') do
        image = MovieService.new.movie_images(438631)
        expect(image[:backdrops]).to be_a Array
        expect(image[:logos]).to be_a Array
        expect(image[:posters]).to be_a Array
      end
    end
  end
end