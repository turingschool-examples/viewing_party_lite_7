# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  before :each do
    @movie = Movie.new({ original_title: 'Jarhead',
                         vote_average: 6.617,
                         runtime: 123,
                         genres: 'Drama',
                         overview: "Jarhead is a film about a US Marine Anthony Swofford's experience in the Gulf War." })
  end
  describe 'creates movie object' do
    it 'initializes with attributes' do
      expect(@movie).to be_a Movie
      expect(@movie.title).to be_a String
      expect(@movie.title).to eq('Jarhead')
      expect(@movie.vote_average).to be_a Float
      expect(@movie.vote_average).to eq(6.617)
      expect(@movie.runtime).to be_a Integer
      expect(@movie.runtime).to eq(123)
      expect(@movie.genres).to be_a String
      expect(@movie.genres).to eq('Drama')
      expect(@movie.summary).to be_a String
    end
  end

  describe '#runtime_conversion' do
    it 'converts minutes to interpolated hr/min' do
      expect(@movie.runtime_conversion).to eq('2hr 3min')
    end
  end
end
