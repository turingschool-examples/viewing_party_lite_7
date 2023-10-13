# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, test: :model do
  it 'exists' do
    attrs = {
      id: 50,
      title: 'Jaws',
      poster_path: 'img_link',
      vote_average: 7.77,
      runtime: 190,
      genres: [{ name: 'Horror' }, { name: 'Thriller' }],
      overview: 'Alot of things happened'
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.id).to eq(50)
    expect(movie.title).to eq('Jaws')
    expect(movie.img).to eq('img_link')
    expect(movie.vote_average).to eq(7.77)
    expect(movie.runtime).to eq(190)
    expect(movie.genres).to eq([{ name: 'Horror' }, { name: 'Thriller' }])
    expect(movie.summary).to eq('Alot of things happened')
  end

  describe 'class methods' do
    it '#movie' do
      attrs = {
        id: 50,
        title: 'Jaws',
        img: 'img_link',
        vote_average: 7.77,
        runtime: 190,
        genres: [{ name: 'Horror' }, { name: 'Thriller' }],
        overview: 'Alot of things happened'
      }

      movie = Movie.new(attrs)

      expect(Movie.movie).to eq(movie)
    end
  end

  describe 'instance methods' do
    before :each do
      attrs = {
        id: 50,
        title: 'Jaws',
        img: 'img_link',
        vote_average: 7.77,
        runtime: 190,
        genres: [{ name: 'Horror' }, { name: 'Thriller' }],
        overview: 'Alot of things happened'
      }

      @movie = Movie.new(attrs)
    end

    it '#find_genres' do
      expect(@movie.find_genres).to eq('Horror, Thriller')
    end

    it '#find_runtime' do
      expect(@movie.find_runtime).to eq('3h 10mins')
    end
  end
end
