require 'rails_helper'

RSpec.describe Movie do 
  describe 'initialize' do 
    before(:each) do 
      @movie = Movie.new({
        title: 'Soul',
        vote_average: 9.75, 
        id: 3, 
        runtime: 127,
        genres: ['family', 'animation'], 
        overview: 'this is a summary'
        })
    end

    describe 'initialize' do 
      it 'exists' do 
        expect(@movie).to be_a Movie
      end

      it 'has attributes' do 
        expect(@movie.title).to eq('Soul')
        expect(@movie.vote_average).to eq(9.75)
        expect(@movie.id).to eq(3)
        expect(@movie.runtime).to eq(127)
        expect(@movie.genres).to eq(['family', 'animation'])
        expect(@movie.overview).to eq('this is a summary')
      end
    end

    describe 'instance_methods' do 
      it 'format_runtime' do 
        expect(@movie.format_runtime).to eq('2 hours, 7 minutes')
      end
    end
  end
end