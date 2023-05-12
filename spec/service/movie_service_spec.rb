require 'rails_helper'

RSpec.describe MovieService, :vcr do
  describe 'Class constants' do
    it 'has an api domain' do
      expect(MovieService::API_DOMAIN).to eq('https://api.themoviedb.org/3')
    end

    it 'has images domain' do
      expect(MovieService::IMAGES_DOMAIN).to eq('https://image.tmdb.org/t/p/original')
    end

    it 'has a default image URL' do
      expect(MovieService::DEFAULT_IMAGE_URL).to eq('https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg')
    end
  end

  describe 'instance methods' do
    describe '#top_rated_movies' do
      it 'returns the top 20 rated movies' do
        top_rated_movies = MovieService.new.top_rated_movies
        expect(top_rated_movies).to be_a(Array)

        top_rated_movies.each do |movie_data|
          expect(movie_data).to be_a(Hash)
          expect(movie_data).to have_key(:id)
          expect(movie_data).to have_key(:title)
          expect(movie_data).to have_key(:image_url)
          expect(movie_data).to have_key(:rating)

          expect(movie_data[:id]).to be_a(Integer)
          expect(movie_data[:title]).to be_a(String)
          expect(movie_data[:image_url]).to be_a(String)
          expect(movie_data[:rating]).to be_a(Float)
        end
      end
    end

    describe '#search_movies' do
      it 'returns up to 20 movies from the search results' do
        search_results = MovieService.new.search_movies('The Matrix')
        expect(search_results).to be_a(Array)

        search_results.each do |movie_data|
          expect(movie_data).to be_a(Hash)
          expect(movie_data).to have_key(:id)
          expect(movie_data).to have_key(:title)
          expect(movie_data).to have_key(:image_url)
          expect(movie_data).to have_key(:rating)

          expect(movie_data[:id]).to be_a(Integer)
          expect(movie_data[:title]).to be_a(String)
          expect(movie_data[:image_url]).to be_a(String)
          expect(movie_data[:rating]).to be_a(Float)
        end
      end
    end

    describe '#full_movie_data' do
      it 'returns the full data for a movie' do
        movie_data = MovieService.new.full_movie_data(11)
        expect(movie_data).to be_a(Hash)

        expect(movie_data).to have_key(:id)
        expect(movie_data).to have_key(:title)
        expect(movie_data).to have_key(:image_url)
        expect(movie_data).to have_key(:rating)
        expect(movie_data).to have_key(:runtime)
        expect(movie_data).to have_key(:genres)
        expect(movie_data).to have_key(:summary)
        expect(movie_data).to have_key(:cast)
        expect(movie_data).to have_key(:reviews)

        expect(movie_data[:genres]).to be_an(Array)
        expect(movie_data[:cast]).to be_an(Array)
        expect(movie_data[:reviews]).to be_an(Array)

        movie_data[:genres].each do |genre|
          expect(genre).to be_a(String)
        end

        movie_data[:cast].each do |cast_member|
          expect(cast_member).to be_a(String)
        end

        movie_data[:reviews].each do |review|
          expect(review).to have_key(:author)
          expect(review).to have_key(:content)

          expect(review[:author]).to be_a(String)
          expect(review[:content]).to be_a(String)
        end
      end
    end
  end
end
