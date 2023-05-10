# frozen_string_literal: true

require 'rails_helper'

describe MovieService do
  context 'class methods' do
    context '#Top_20_movies' do
      it 'returns movies data' do
        search = MovieService.new.top_20_movies
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        expect(search[:results].count).to eq(20)
        first_movie_data = search[:results].first

        expect(first_movie_data).to have_key :id
        expect(first_movie_data[:id]).to be_a(Integer)

        expect(first_movie_data).to have_key :title
        expect(first_movie_data[:title]).to be_a(String)

        expect(first_movie_data).to have_key :vote_average
        expect(first_movie_data[:vote_average]).to be_a(Integer)

        expect(first_movie_data).to have_key :overview
        expect(first_movie_data[:overview]).to be_a(Text)

        expect(first_movie_data).to have_key :poster_path
        expect(first_movie_data[:poster_path]).to be_an(String)
      end
    end
    context '#Find_movies_by_search' do
      it 'returns movies data' do
        search = MovieService.new.find_movies_by_search('Interstellar')
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        expect(search[:results].count).to eq(20)
        first_movie_data = search[:results].first

        expect(first_movie_data).to have_key :id
        expect(first_movie_data[:id]).to be_a(Integer)

        expect(first_movie_data).to have_key :title
        expect(first_movie_data[:title]).to be_a(String)

        expect(first_movie_data).to have_key :vote_average
        expect(first_movie_data[:vote_average]).to be_a(Integer)

        expect(first_movie_data).to have_key :overview
        expect(first_movie_data[:overview]).to be_a(Text)

        expect(first_movie_data).to have_key :poster_path
        expect(first_movie_data[:poster_path]).to be_an(String)
      end
    end
  end
end
