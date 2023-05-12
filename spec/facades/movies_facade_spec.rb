require 'rails_helper'

RSpec.describe MoviesFacade, :vcr do
  describe '#search?' do
    it 'returns "search" when search_results is present' do
      facade = MoviesFacade.new(movie_title: 'Lock, Stock and Two Smoking Barrels')
      expect(facade.search?).to eq(true)
    end

    it 'returns "top_20" when search_results is not present' do
      facade = MoviesFacade.new({})
      expect(facade.search?).to eq(false)
    end
  end

  describe '#top_20' do
    it 'returns an array of Movie objects' do
      facade = MoviesFacade.new({})
      expect(facade.top_20).to all(be_an_instance_of(Movie))
    end
  end

  describe '#search_results' do
    it 'returns an array of Movie objects' do
      facade = MoviesFacade.new(movie_title: 'The Godfather')
      expect(facade.search_results).to all(be_an_instance_of(Movie))
    end
  end

  describe '#specific_movie' do
    it 'returns a Movie object' do
      facade = MoviesFacade.new(id: 238)
      expect(facade.specific_movie).to be_an_instance_of(Movie)
    end
  end

  describe '#cast_info' do
    it 'returns an array of Cast objects' do
      facade = MoviesFacade.new(id: 100)
      expect(facade.cast_info).to all(be_an_instance_of(Cast))
    end
  end

  describe '#review_info' do
    it 'returns an array of Review objects' do
      facade = MoviesFacade.new(id: 238)
      expect(facade.review_info).to all(be_an_instance_of(Review))
    end
  end

  describe '#review_count' do
    it 'returns the number of reviews for a movie' do
      facade = MoviesFacade.new(id: 238)
      expect(facade.review_count).to eq(facade.review_info.count)
    end
  end
end