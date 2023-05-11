require 'rails_helper'

describe MovieService do
  describe "class methods" do

    describe "#get_top_rated_movies", :vcr do
      it "gets the top 20 rated movies" do
        top_20 = MovieService.new.get_top_rated_movies
        expect(top_20).to be_a Hash

        expect(top_20[:results]).to be_an Array
        expect(top_20[:results].count).to eq(20)
        movie_data = top_20[:results].first

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)

        expect(movie_data).to have_key :vote_count
        expect(movie_data[:vote_count]).to be_a(Integer)

        expect(movie_data).to have_key :genre_ids
        expect(movie_data[:genre_ids]).to be_a(Array)
      end
    end

    describe "#get_movie_search", :vcr do
      it "gets movies from search results" do
        search = MovieService.new.get_movie_search("Princess")
        expect(search).to be_a Hash

        expect(search[:results]).to be_an Array
        movie_data = search[:results].first

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)

        expect(movie_data).to have_key :vote_count
        expect(movie_data[:vote_count]).to be_a(Integer)

        expect(movie_data).to have_key :genre_ids
        expect(movie_data[:genre_ids]).to be_a(Array)
      end
    end

    describe "#get_specific_movie", :vcr do
      it "gets movies from and specific ID" do
        search = MovieService.new.get_specific_movie("238")
        expect(search).to be_a Hash

        expect(search).to have_key :title
        expect(search[:title]).to be_a(String)

        expect(search).to have_key :vote_average
        expect(search[:vote_average]).to be_a(Float)

        expect(search).to have_key :vote_count
        expect(search[:vote_count]).to be_a(Integer)

        expect(search).to have_key :genres
        expect(search[:genres]).to be_a(Array)
      end
    end

    describe "#get_movie_cast_info", :vcr do
      it "gets cast info for a specific movie" do
        search = MovieService.new.get_movie_cast_info("238")
        expect(search).to be_a Hash

        expect(search).to have_key :cast
        expect(search[:cast]).to be_a(Array)

        expect(search[:cast].first).to have_key :name
        expect(search[:cast].first[:name]).to be_a(String)

        expect(search[:cast].first).to have_key :character
        expect(search[:cast].first[:character]).to be_a(String)
      end
    end

    describe "#get_movie_review_info", :vcr do
      it "gets review info for a specific movie" do
        search = MovieService.new.get_movie_review_info("238")
        expect(search).to be_a Hash

        expect(search).to have_key :results
        expect(search[:results]).to be_a(Array)

        expect(search[:results].first).to have_key :author
        expect(search[:results].first[:author]).to be_a(String)

        expect(search[:results].first).to have_key :content
        expect(search[:results].first[:content]).to be_a(String)
      end
    end

  end
end