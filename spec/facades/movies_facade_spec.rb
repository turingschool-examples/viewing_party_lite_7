# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoviesFacade do
  describe '#movies' do
    let(:query) { nil }
    let(:top_rated) { nil }
    let(:movies_facade) { MoviesFacade.new(query, top_rated) }

    context 'when top_rated is true' do
      let(:top_rated) { true }

      it 'fetches top-rated movies', :vcr do
        expect(movies_facade.movies).to all(be_an_instance_of(Movie))
        expect(movies_facade.movies.first.title).to eq('The Godfather')
        expect(movies_facade.movies.first.vote_average).to eq(8.7)
      end
    end

    context 'when query is provided' do
      let(:query) { 'Shawshank Redemption' }

      it 'fetches movies by title', :vcr do
        expect(movies_facade.movies).to all(be_an_instance_of(Movie))
        expect(movies_facade.movies.first.title).to eq('The Shawshank Redemption')
        expect(movies_facade.movies.first.vote_average).to eq(8.704)
      end
    end
  end
end
