# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    it '.top_rated_movies', :vcr do
      response = MovieService.top_rated_movies

      expect(response).to be_a Hash
      expect(response[:results]).to be_an Array

      response[:results].each do |movie|
        expect(movie).to have_key :original_title
        expect(movie[:original_title]).to be_a String
        expect(movie).to have_key :vote_average
        expect(movie[:vote_average]).to be_a Float
      end
    end
    
    it '.search_by_title', :vcr do
      response = MovieService.search_by_title("Jack")

      expect(response).to be_a Hash
      expect(response[:results]).to be_an Array

      response[:results].each do |movie|
        expect(movie).to have_key :original_title
        expect(movie[:original_title]).to be_a String
        expect(movie).to have_key :vote_average
        expect(movie[:vote_average]).to be_a Float
      end
    end

    it '.find_by_id', :vcr do
      response = MovieService.find_by_id(25)

      expect(response).to be_a Hash
      expect(response).to have_key :original_title
      expect(response[:original_title]).to be_a String
      expect(response).to have_key :vote_average
      expect(response[:vote_average]).to be_a Float
      expect(response).to have_key :runtime
      expect(response[:runtime]).to be_a Integer
      expect(response).to have_key :genres
      expect(response[:genres]).to be_an Array
      expect(response).to have_key :overview
      expect(response[:overview]).to be_a String
    end

    it '.cast', :vcr do
      response = MovieService.cast(25)

      expect(response).to be_a Hash
      expect(response).to have_key :cast
      expect(response[:cast]).to be_an Array
      
      response[:cast].each do |cast|
        expect(cast).to have_key :name
        expect(cast[:name]).to be_a String
        expect(cast).to have_key :character
        expect(cast[:character]).to be_a String
      end
    end

    it '.reviews', :vcr do
      response = MovieService.reviews(569094)
      expect(response).to be_a Hash
      expect(response).to have_key :results
      expect(response[:results]).to be_an Array

      response[:results].each do |review|
        expect(review).to have_key :author
        expect(review[:author]).to be_a String
        expect(review).to have_key :content
        expect(review[:content]).to be_a String
      end
    end
  end
end
