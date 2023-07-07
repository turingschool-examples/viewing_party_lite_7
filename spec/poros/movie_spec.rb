require 'rails_helper'

RSpec.describe Movie do 
  describe 'initialize' do 
    before(:each) do 
      @movie = Movie.new({
        title: 'Soul',
        vote_average: '9.75'})
    end

    it 'exists' do 
      expect(@movie).to be_a Movie
    end

    it 'has attributes' do 
      expect(@movie.title).to eq('Soul')
      expect(@movie.vote_average).to eq('9.75')
    end
  end
end