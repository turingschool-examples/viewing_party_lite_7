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
        top_rated_movies = MovieService.new.top_rated_movies()
        expect(top_rated_movies).to be_a(Array)

        top_movie = top_rated_movies.first
        expect(top_movie).to have_key(:id)
        expect(top_movie).to have_key(:title)
        expect(top_movie).to have_key(:image_url)
        expect(top_movie).to have_key(:rating)

        expect(top_movie[:id]).to be_a(Integer)
        expect(top_movie[:title]).to be_a(String)
        expect(top_movie[:image_url]).to be_a(String)
        expect(top_movie[:rating]).to be_a(Float)
      end
    end

    describe '#search_movies' do
      it 'returns up to 20 movies from the search results' do
        movies_search_results = MovieService.new.search_movies('The Matrix')
      end
    end

    describe 'get_movie_details' do

    end

    describe 'get_movie_cast' do

    end

    describe '#get_movie_reviews' do

    end

    describe '#movies_data' do

    end

    describe '#movie_details' do

    end
  end
end
