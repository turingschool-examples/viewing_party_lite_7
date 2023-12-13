require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    before(:each) do
      @user = User.create(name: 'Joseph', email: 'jlee230@turing.edu')
    end

    context '#conn' do
      it 'returns a Faraday connection' do
        conn = MovieService.conn

        expect(conn).to be_a(Faraday::Connection)
      end
    end

    context '#get_url' do
      it 'returns a parsed response' do
        VCR.use_cassette('top_rated_movies') do
          response = MovieService.get_url('/3/movie/top_rated')

          expect(response).to be_a(Hash)
          expect(response).to have_key(:results)
        end
      end
    end

    context '#top_rated' do
      it 'returns the top rated movies' do
        VCR.use_cassette('top_rated_movies') do
          movies = MovieService.top_rated[:results]

          expect(movies).to be_an(Array)
          expect(movies.first).to be_a(Hash)
          expect(movies.first).to have_key(:title)
          expect(movies.first).to have_key(:vote_average)
        end
      end
    end

    context 'search' do
      it 'returns movies based on search term' do
        VCR.use_cassette('search_movies') do
          movies = MovieService.search('The Matrix')[:results]

          expect(movies).to be_an(Array)
          expect(movies.first).to be_a(Hash)
          expect(movies.first).to have_key(:title)
          expect(movies.first[:title]).to include('Matrix')
        end
      end
    end

    context 'movie_details' do
      it 'returns movie details' do
        VCR.use_cassette('movie_details') do
          movie = MovieService.movie_details(603)

          expect(movie).to be_a(Hash)
          expect(movie.first).to be_an(Array)

          expect(movie).to have_key(:title)
          expect(movie).to have_key(:id)
          expect(movie).to have_key(:runtime)
        end
      end
    end

    context 'cast' do
      it 'returns cast members' do
        VCR.use_cassette('cast') do
          cast = MovieService.cast(603)[:cast]

          expect(cast).to be_an(Array)
          expect(cast.first).to be_a(Hash)

          expect(cast.first).to have_key(:name)
          expect(cast.first).to have_key(:character)
        end
      end
    end

    context 'reviews' do
      it 'returns reviews' do
        VCR.use_cassette('reviews') do
          reviews = MovieService.reviews(603)[:results]

          expect(reviews).to be_an(Array)
          expect(reviews.first).to be_a(Hash)
          expect(reviews.first).to have_key(:author)
          expect(reviews.first).to have_key(:content)
        end
      end
    end
  end
end
