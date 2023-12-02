require 'rails_helper'

RSpec.describe Movie do 
  it 'exists' do 
    movie = Movie.new({id: 1, original_title: 'Barbie', vote_average: 7.5, runtime: 123, genres: 'comedy', overview: 'Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.'})
    expect(movie).to be_a(Movie)
    expect(movie).to respond_to(:id)
    expect(movie).to respond_to(:original_title)
    expect(movie).to respond_to(:vote_average)
    expect(movie).to respond_to(:runtime)
    expect(movie).to respond_to(:genres)
    expect(movie).to respond_to(:overview)
  end

  describe 'instance methods' do 
    it 'has a formats total runtime into hrs and mins' do
      movie = Movie.new({id: 1, original_title: 'Barbie', vote_average: 7.5, runtime: 123, genres: 'comedy', overview: 'Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.'})

      expect(movie.formatted_runtime).to eq('2hr 5min')
  end
end