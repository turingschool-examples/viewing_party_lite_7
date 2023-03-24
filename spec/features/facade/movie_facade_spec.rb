require 'rails_helper'

RSpec.describe MovieFacade, type: :model do
  describe '#movies' do
    context 'when the keyword is "top rated"' do
      it 'returns a list of top rated movies' do
        VCR.use_cassette(:top_movies, serialize_with: :json) do
          movies = MovieFacade.new(keyword: 'top rated').movies
          expect(movies.count).to eq(20)
          expect(movies.first).to be_a(Movie)
        end
      end
    end

    context 'when the keyword is not "top rated"' do
      it 'returns a list of searched movies' do
        VCR.use_cassette(:movies_search, serialize_with: :json) do
          movies = MovieFacade.new(keyword: 'batman').movies
          expect(movies.count).to eq(20)
          expect(movies.first).to be_a(Movie)
        end
      end
    end
  end

  describe '#movie_details' do
    it 'returns the details of a movie' do
      VCR.use_cassette(:movie_details, serialize_with: :json) do
        movie = MovieFacade.new(id: 238).movie_details
        expect(movie.title).to eq('The Godfather')
        expect(movie.runtime).to eq(175)
        expect(movie.vote_average.round(1)).to eq(8.7)
        expect(movie.genres).to include('Drama', 'Crime')
        expect(movie.summary).to include('Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family.')
      end
    end
  end

  describe '#cast_members' do
    it 'returns a list of cast members for a movie' do
      VCR.use_cassette(:movie_cast, serialize_with: :json) do
        cast_members = MovieFacade.new(id: 238).cast_members
        expect(cast_members.count).to eq(10)
        expect(cast_members.first).to be_a(CastMember)
      end
    end
  end

  describe '#movie_reviews' do
    it 'returns a list of reviews for a movie' do
      VCR.use_cassette(:movie_reviews, serialize_with: :json) do
        reviews = MovieFacade.new(id: 238).movie_reviews
        expect(reviews.count).to eq(2)
        expect(reviews.first).to be_a(Review)
      end
    end
  end

  describe '#movie_review_count' do
    it 'returns the number of reviews for a movie' do
      VCR.use_cassette(:movie_reviews, serialize_with: :json) do
        count = MovieFacade.new(id: 238).movie_review_count
        expect(count).to eq(2)
      end
    end
  end
end
