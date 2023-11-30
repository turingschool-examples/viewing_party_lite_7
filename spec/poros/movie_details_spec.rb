require 'rails_helper'

RSpec.describe MovieDetails do
  before(:each) do
    details = File.read('spec/fixtures/movie_details.json')
    credits = File.read('spec/fixtures/movie_credits.json')
    reviews = File.read('spec/fixtures/movie_reviews.json')
    details_parsed = JSON.parse(details, symbolize_names: true)
    credits_parsed = JSON.parse(credits, symbolize_names: true)
    reviews_parsed = JSON.parse(reviews, symbolize_names: true)

    @md = MovieDetails.new(details_parsed, credits_parsed, reviews_parsed)
  end

  it 'exists' do
    expect(@md.title).to be_a String
    expect(@md.vote_average).to be_a Float
    expect(@md.runtime).to be_an Integer
    expect(@md.genres).to be_an Array
    expect(@md.genres.first).to be_a Hash
    expect(@md.summary).to be_a String

    expect(@md.cast).to be_an Array

    expect(@md.total_reviews).to be_an Integer
    expect(@md.reviews).to be_an Array
    expect(@md.reviews.first).to be_a Hash
  end

  describe '#format_runtime' do
    it 'formats the runtime into hours and minutes' do
      expect(@md.runtime).to eq(114)
      expect(@md.format_runtime).to eq('1h 54m')
    end
  end
end
