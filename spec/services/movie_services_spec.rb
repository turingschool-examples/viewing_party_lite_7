# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

describe MovieService do
  context 'helper methods' do
    context 'conn' do
      it 'returns a faraday connection' do
        expect(MovieService.new.conn).to be_a Faraday::Connection
      end
    end

    context 'get_url' do
      it 'returns a faraday response', :vcr do
        expect(MovieService.new.get_url('/3/search/movie')).to be_a Faraday::Response
      end
    end
  end

  context 'class methods' do
    context '#movie_search', :vcr do
      it 'returns movie data from keyword search' do
        search = MovieService.new.movie_search('dog')
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie_data = search[:results].first

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end

    context '#movie_discover', :vcr do
      it 'returns movie data from top 20 movies' do
        search = MovieService.new.movie_discover
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie_data = search[:results].first

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end

    context '#movie', :vcr do
      it 'returns movie data from movie id' do
        movie = MovieService.new.movie(268)
        expect(movie).to be_a Hash

        expect(movie).to have_key :title
        expect(movie[:title]).to be_a(String)

        expect(movie).to have_key :overview
        expect(movie[:overview]).to be_a(String)

        expect(movie).to have_key :genres
        expect(movie[:genres]).to be_a(Array)

        expect(movie).to have_key :runtime
        expect(movie[:runtime]).to be_a(Integer)

        expect(movie).to have_key :vote_average
        expect(movie[:vote_average]).to be_a(Float)

        expect(movie).to have_key :poster_path
        expect(movie[:poster_path]).to be_a(String)
      end
    end

    context '#cast', :vcr do
      it 'returns cast data from movie id' do
        movies = MovieService.new.cast(268)
        expect(movies).to be_a Array
        movie = movies.first

        expect(movie).to have_key :character
        expect(movie[:character]).to be_a(String)

        expect(movie).to have_key :name
        expect(movie[:name]).to be_a(String)
      end
    end

    context '#reviews', :vcr do
      it 'returns review data from movie id' do
        movies = MovieService.new.reviews(268)
        expect(movies).to be_a Hash

        expect(movies).to have_key :total_results
        expect(movies[:total_results]).to be_a(Integer)

        expect(movies[:results]).to be_a Array
        movie = movies[:results].first

        expect(movie).to have_key :content
        expect(movie[:content]).to be_a(String)

        expect(movie).to have_key :author
        expect(movie[:author]).to be_a(String)

        expect(movie).to have_key :author_details
        expect(movie[:author_details][:rating]).to be_a(Float)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
