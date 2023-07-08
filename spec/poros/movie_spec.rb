require 'rails_helper'

RSpec.describe Movie do 
  describe 'initialize' do 
    before(:each) do 
      @movie = Movie.new({
        title: 'Soul',
        vote_average: 9.75, 
        id: 3, 
        runtime: 120,
        genres: ['family', 'animation'], 
        summary: 'this is a summary'
        })
    end

    it 'exists' do 
      expect(@movie).to be_a Movie
    end

    it 'has attributes' do 
      expect(@movie.title).to eq('Soul')
      expect(@movie.vote_average).to eq(9.75)
      expect(@movie.id).to eq(3)
      expect(@movie.runtime).to eq(120)
      expect(@movie.genres).to eq(['family', 'animation'])
      expect(@movie.summary).to eq('this is a summary')
    end
  end
end