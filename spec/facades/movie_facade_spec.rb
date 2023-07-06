require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'search' do
    it 'returns an array of movie objects' do
      movie_facade = MovieFacade.new
      movies = movie_facade.search('King')
      expect(movies).to be_an(Array)
    end
  end

end