require 'rails_helper'

describe ThemoviedbService do
  describe "class methods" do
    describe "#poster_image_base_url" do 
      it "returns the base url and size options for pictures" do

        VCR.use_cassette("user_dashboard_page_1") do
          photo_info = ThemoviedbService.new.poster_image_base_url

          expect(photo_info).to be_a Hash
          expect(photo_info[:base_url]).to eq("http://image.tmdb.org/t/p/")
          expect(photo_info[:poster_sizes][1]).to eq("w154")
        end
      end
    end

    describe "#movie_details" do 
      it "returns movie details for a specific movie" do

        VCR.use_cassette("godfather_movie_details") do
          godfather_movie_details = ThemoviedbService.new.movie_details(238)

          expect(godfather_movie_details).to be_a Hash
          expect(godfather_movie_details[:genres]).to be_an Array
          expect(godfather_movie_details[:id]).to be_an Integer
          expect(godfather_movie_details[:title]).to eq("The Godfather")
        end
      end
    end

    describe "#movie_credits" do 
      it "returns characters and actor/actresses from a movie" do

        VCR.use_cassette("godfather_movie_details") do
          godfather_movie_credits = ThemoviedbService.new.movie_credits(238)

          expect(godfather_movie_credits).to be_a Hash
          expect(godfather_movie_credits[:cast]).to be_an Array
          expect(godfather_movie_credits[:cast][0]).to be_a Hash
          expect(godfather_movie_credits[:cast][0][:character]).to eq("Don Vito Corleone")
          expect(godfather_movie_credits[:cast][0][:name]).to eq("Marlon Brando")
        end
      end
    end

    describe "#movie_reviews" do 
      it "returns a list of reviews for a specific movie" do

        VCR.use_cassette("godfather_movie_details") do
          godfather_movie_reviews = ThemoviedbService.new.movie_reviews(238)

          expect(godfather_movie_reviews).to be_a Hash
          expect(godfather_movie_reviews[:results]).to be_an Array
          expect(godfather_movie_reviews[:results].count).to eq(5)
          expect(godfather_movie_reviews[:results][0]).to be_a Hash
          expect(godfather_movie_reviews[:results][0][:author]).to eq("futuretv")
          expect(godfather_movie_reviews[:results][0][:content]).to be_a String
          expect(godfather_movie_reviews[:results][4][:content]).to eq("Great Movie **Ever**")
        end
      end
    end

    describe "#movie_title" do 
      it "returns a list of reviews for a specific movie" do

        VCR.use_cassette("search_by_title") do
          movie_title_search = ThemoviedbService.new.movie_titles("Fight Club")

          expect(movie_title_search).to be_a Array
          expect(movie_title_search.count).to eq(20)
          expect(movie_title_search[0]).to be_a Hash
          expect(movie_title_search[0][:id]).to be_an Integer
          expect(movie_title_search[0][:title]).to be_an String
          expect(movie_title_search[0][:vote_average]).to be_an Float
        end
      end
    end

    describe "#top_movies" do 
      it "returns a list of top movies by review" do

        VCR.use_cassette("discover_movies_top_rated") do
          top_movies = ThemoviedbService.new.top_movies

          expect(top_movies).to be_a Array
          expect(top_movies.count).to eq(20)
          expect(top_movies[0]).to be_a Hash
          expect(top_movies[0][:id]).to be_an Integer
          expect(top_movies[0][:title]).to be_an String
          expect(top_movies[0][:vote_average]).to be_an Float
        end
      end
    end
  end
end