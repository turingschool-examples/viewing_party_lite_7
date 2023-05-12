require 'rails_helper'

RSpec.describe MovieInfo do
  describe '#initialize' do
    it 'exists and has attributes' do
      info = { 'genres': [{ 'id': 35,
                            'name': 'Comedy' },
                          { 'id': 10749,
                            'name': 'Romance' }],
               'id': 734265,
               'overview': "An LA girl, unlucky in love, falls for an East Coast guy on a dating app and decides to surprise him for Christmas, only to discover that she's been catfished. But the object of her affection actually lives in the same town, and the guy who duped her offers to set them up if she pretends to be his own girlfriend for the holidays.",
               'poster_path': '/oTkAFDZRLnqrXOrOwuy3Tvul0v5.jpg',
               'runtime': 105,
               'title': 'Love Hard',
               'vote_average': 7.017 }

      movie = MovieInfo.new(info)
      expect(movie).to be_a(MovieInfo)
      expect(movie.id).to eq(734265)
      expect(movie.title).to eq("Love Hard")
      expect(movie.vote_average).to eq(7.017)
      expect(movie.poster).to eq('/oTkAFDZRLnqrXOrOwuy3Tvul0v5.jpg')
      # expect(movie.genres).to eq(['Comedy', 'Romance'])
      expect(movie.runtime).to eq(105)
      expect(movie.summary.include?('An LA girl, unlucky in love')).to eq(true)
    end
  end
end