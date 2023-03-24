# frozen_string_literal: true

require 'rails_helper'

describe MovieService do
  context 'class methods' do
    context '#top_movies' do
      it 'returns top movie hash' do
        VCR.use_cassette(:top_movies, serialize_with: :json) do
          top_movies = MovieService.top_movies
          expect(top_movies).to be_a Hash
        end
      end
    end
    context '#movies_by_title' do
      it 'returns movie data' do
        VCR.use_cassette(:movies_search, serialize_with: :json) do
          search = MovieService.movies_search('Fight Club')
          expect(search).to be_a Hash
          expect(search[:results]).to be_an Array
          movie_data = search[:results].first

          expect(movie_data).to have_key :title
          expect(movie_data[:title]).to be_a(String)

          expect(movie_data).to have_key :vote_average
          expect(movie_data[:vote_average]).to be_a(Float)

          expect(movie_data).to have_key :overview
          expect(movie_data[:overview]).to be_a(String)
        end
      end
    end
  end
end
