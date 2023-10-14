# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoviesService do
  describe '#movie_images' do
    it 'returns movie image information' do
      json_response = File.read('spec/fixtures/movie_images.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/926393/images?api_key=#{Rails.application.credentials.tmdb[:key]}")
        .to_return(status: 200, body: json_response)

      images = MoviesService.new.movie_images(926_393)
      expect(images).to be_a Hash
      expect(images[:posters]).to be_an Array

      poster = images[:posters].first

      expect(poster).to have_key :aspect_ratio
      expect(poster[:aspect_ratio]).to be_a Float

      expect(poster).to have_key :file_path
      expect(poster[:file_path]).to be_a String
    end
  end

  describe '#movie_details' do
    it 'returns movie detail information' do
      json_response = File.read('spec/fixtures/movie_details.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/926393?api_key=#{Rails.application.credentials.tmdb[:key]}")
        .to_return(status: 200, body: json_response)

      details = MoviesService.new.movie_details(926_393)

      expect(details).to be_a Hash
      expect(details[:title]).to be_a String
    end
  end

  describe '#get_credits' do
    it 'returns credits of a movie' do
      json_response = File.read('spec/fixtures/movie_credits.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/926393/credits?api_key=#{Rails.application.credentials.tmdb[:key]}")
        .to_return(status: 200, body: json_response)

      credits = MoviesService.new.get_credits(926_393)

      expect(credits).to be_a Hash
      expect(credits[:cast]).to be_an Array

      member = credits[:cast].first

      expect(member).to be_a Hash
      expect(member).to have_key :name
      expect(member[:name]).to be_a String
      expect(member).to have_key :character
      expect(member[:character]).to be_a String
    end
  end

  describe '#get_reviews' do
    it "returns a movie's reviews" do
      json_response = File.read('spec/fixtures/movie_reviews.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/926393/reviews?api_key=#{Rails.application.credentials.tmdb[:key]}")
        .to_return(status: 200, body: json_response)

      reviews = MoviesService.new.get_reviews(926_393)

      expect(reviews).to be_a Hash
      expect(reviews[:results]).to be_an Array

      review = reviews[:results].first

      expect(review).to be_a Hash
      expect(review).to have_key :author
      expect(review[:author]).to be_a String
      expect(review).to have_key :content
      expect(review[:content]).to be_a String
    end
  end
end
