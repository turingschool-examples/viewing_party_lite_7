# frozen_string_literal: true

require 'rails_helper'
require './app/facades/movie_facade'

RSpec.describe MovieFacade do
  describe 'top rated movies endpoint' do
    it 'displays movie attributes' do
      json_response = File.read('spec/fixtures/top_movies.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_KEY']}")
        .to_return(status: 200, body: json_response)

      movie = MovieDetail.new(JSON.parse(json_response, symbolize_names: true)[:results].first)

      expect(movie.title).to eq('The Godfather')
      expect(movie.vote_average).to eq(8.7)
      expect(movie.overview).to eq('Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.')
    end

    it 'creates top rated movies poros' do
      json_response = File.read('spec/fixtures/top_movies.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_KEY']}")
        .to_return(status: 200, body: json_response)

      movie = MovieDetail.new(JSON.parse(json_response, symbolize_names: true)[:results].first)

      top_rated = MovieFacade.top_rated

      expect(top_rated.first).to be_a(MovieDetail)
    end
  end
end
