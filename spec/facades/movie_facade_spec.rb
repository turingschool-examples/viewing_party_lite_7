require 'rails_helper'

RSpec.describe MovieFacade, :vcr do
  before(:each) do
    @user = create(:user)
    @movie_facade = MovieFacade.new(@user)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@movie_facade).to be_a(MovieFacade)
    end
  end

  describe '#user' do
    it 'has a user' do
      expect(@movie_facade.user).to be_a(User)
      expect(@movie_facade.user).to eq(@user)
    end
  end

  describe '#movie_details' do
    it 'returns all the information for the movie details page' do
      expected = @movie_facade.movie_details(11)

      expect(expected).to be_a(UserMovies)
      expect(expected.type).to eq('details')
      expect(expected.movies).to be_a(Movie)
      expect(expected.user).to be(@user)
    end
  end

  describe '#viewing_parties' do
    it 'returns all of the viewing parties information for a user' do
      expected = @movie_facade.viewing_parties([11, 13, 278])

      expect(expected).to be_a(UserMovies)
      expect(expected.type).to eq('viewing parties')
      expect(expected.movies).to be_an(Array)
      expect(expected.user).to be(@user)
    end
  end

  describe '#top_20_movies' do
    it 'returns the top 20 movies' do
      expected = @movie_facade.top_20_movies

      expect(expected).to be_a(UserMovies)
      expect(expected.type).to eq('top rated')
      expect(expected.movies.count).to eq(20)
      expect(expected.movies).to all(be_a(Movie))
      expect(expected.movies).to be_an(Array)
      expect(expected.user).to be(@user)
    end
  end

  describe '#search_movies' do
    it 'returns the search results from a given search query' do
      expected = @movie_facade.search_movies('star wars')

      expect(expected).to be_a(UserMovies)
      expect(expected.type).to eq('search')
      expect(expected.movies).to be_an(Array)
      expect(expected.movies).to all(be_a(Movie))
      expect(expected.user).to be(@user)
    end
  end
end
