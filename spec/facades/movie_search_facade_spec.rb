require 'rails_helper'

RSpec.describe MovieSearchFacade, type: :facade do
  describe 'movie search facade' do
    before(:each) do
      @facade = MovieSearchFacade.new  
    end

    it 'exists' do
      expect(@facade).to be_a(MovieSearchFacade)
    end

    it '#top_rated_movies' do
      expect(@facade.top_rated_movies).to be_a(Array)
      @facade.top_rated_movies.each do |movie|
        expect(movie).to be_a(Movie)
        expect(movie).to respond_to(:movie_id)
        expect(movie).to respond_to(:summary)
        expect(movie).to respond_to(:title)
        expect(movie).to respond_to(:vote_avg)
      end
    end
  end
end