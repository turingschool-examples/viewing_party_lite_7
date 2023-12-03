require 'rails_helper'

describe MovieService do
  context 'class methods' do
    context '#top_rated_20' do
      it 'returns top 20 movies' do
        VCR.use_cassette('top_20_rated_movies') do
          search = MovieService.new.top_rated_20
          expect(search).to be_a(Hash)
          expect(search[:results]).to be_an(Array)
          movie_data = search[:results].first

          expect(movie_data).to have_key :original_title
          expect(movie_data[:original_title]).to be_a(String)

          expect(movie_data).to have_key :vote_average
          expect(movie_data[:vote_average]).to be_a(Float)
        end
      end
    end

    context '#search(movies)' do
      it 'searches for movies' do
        VCR.use_cassette('search_for_terminator') do
          movie = 'terminator'
          search = MovieService.new.search(movie)
          expect(search).to be_a(Hash)
          expect(search[:results]).to be_an(Array)
          movie_data = search[:results].first

          expect(movie_data).to have_key :original_title
          expect(movie_data[:original_title]).to be_a(String)

          expect(movie_data).to have_key :vote_average
          expect(movie_data[:vote_average]).to be_a(Float)
        end
      end
    end

    context '#get_movie(movie_id)' do
      it 'gets movie' do
        VCR.use_cassette('batman_details') do
          movie_id = 155
          search = MovieService.new.get_movie(movie_id)
          expect(search).to be_a(Hash)

          movie_data = search

          expect(movie_data).to have_key :original_title
          expect(movie_data[:original_title]).to be_a(String)

          expect(movie_data).to have_key :vote_average
          expect(movie_data[:vote_average]).to be_a(Float)

          expect(movie_data).to have_key :runtime
          expect(movie_data[:runtime]).to be_a(Integer)

          expect(movie_data).to have_key :genres
          expect(movie_data[:genres]).to be_a(Array)
        end
      end
    end

    context '#get_cast_member(movie_id)' do
      it 'gets the movies cast members' do
        VCR.use_cassette('batman_cast_member_details') do
          movie_id = 155
          search = MovieService.new.get_cast_member(movie_id)
          expect(search).to be_a(Hash)

          movie_data = search[:cast].first

          expect(movie_data).to have_key :name
          expect(movie_data[:name]).to be_a(String)

          expect(movie_data).to have_key :character
          expect(movie_data[:character]).to be_a(String)
        end
      end
    end

    context '#get_reviews(movie_id)' do
      it 'gets the movies reviews' do
        VCR.use_cassette('batman_review_details') do
          movie_id = 155
          search = MovieService.new.get_reviews(movie_id)
          expect(search).to be_a(Hash)

          movie_data = search[:results].first

          expect(movie_data).to have_key :author
          expect(movie_data[:author]).to be_a(String)

          expect(movie_data).to have_key :content
          expect(movie_data[:content]).to be_a(String)

          movie_review_data = movie_data[:author_details]

          expect(movie_review_data).to have_key :rating
        end
      end
    end
  end
end
