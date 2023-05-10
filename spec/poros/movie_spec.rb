require './app/poros/movie.rb'
# require 'rails_helper'

RSpec.describe Movie do
  before(:all) do
    data = {
      title: "Frozen",
      vote_average: 4,
      runtime: 55,
      genres: "drama",
      overview: "movie about ice and stuff"
      }

    @movie = Movie.new(data)
  end
  describe 'initialize' do
    it 'exists' do
      expect(@movie).to be_a(Movie)
    end

    it 'initializes with attributes' do
      expect(@movie.title).to eq('Frozen')
      expect(@movie.rating).to eq(4)
      expect(@movie.runtime).to eq(55)
      expect(@movie.genres).to eq("drama")
      expect(@movie.summary).to eq("movie about ice and stuff")
    end
  end
end