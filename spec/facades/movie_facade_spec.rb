# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'creates movie facade' do
    it 'returns top rated movies', :vcr do
      movies = MovieFacade.top_movies

      expect(movies).to be_a Array
      expect(movies.first).to be_a Movie
      expect(movies.first.title).to be_a String
      expect(movies.count).to eq(20)
    end
  end
end
