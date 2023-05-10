require 'rails_helper'

RSpec.describe Movie do
  describe 'initialize' do
    it 'exists and has attributes' do
      data = { id: 550, 
              title: 'Fight Club', 
              poster_path: "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg", 
              overview: "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
              vote_average: 8.433 }
      movie = Movie.new(data)
  
      expect(movie).to be_a(Movie)
      expect(movie.id).to eq(550)
      expect(movie.title).to eq('Fight Club')
      expect(movie.image).to eq('/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg')
      expect(movie.summary).to eq("A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.")
      expect(movie.vote_average).to eq(8.433)
      expect(movie.genre).to eq(nil)
      expect(movie.runtime).to eq(nil)
    end
  end
end