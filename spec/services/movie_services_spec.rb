require 'rails_helper'

describe MovieService do
  context "class methods" do
    context "#details_api_call(movie_id)" do
      it "retrieves api details about a movie", :vcr do
        movie = MovieService.details_api_call(808)
        expect(movie).to be_a Hash
      
        expect(movie).to have_key :title
        expect(movie[:title]).to be_a(String)

        expect(movie).to have_key :genres
        expect(movie[:genres]).to be_a(Array)

        expect(movie).to have_key :overview
        expect(movie[:overview]).to be_a(String)

        expect(movie).to have_key :vote_average
        expect(movie[:vote_average]).to be_a(Float)
      end
    end

    context "#image_api_call(movie_id)" do
      it "retrieves image url", :vcr do
        url = MovieService.image_api_call(808)
        expect(url).to eq("https://www.themoviedb.org/t/p/w600_and_h900_bestv2//dyhaB19AICF7TO7CK2aD6KfymnQ.jpg")
      end
    end

    context "#top movies" do
      it "retrieves top 20 movies", :vcr do
        movies = MovieService.top_movies
        expect(movies).to be_a Hash
        expect(movies[:results]).to be_a Array

        expect(movies[:results].first).to have_key :title
        expect(movies[:results].first[:title]).to be_a(String)

        expect(movies[:results].first).to have_key :genre_ids
        expect(movies[:results].first[:genre_ids]).to be_a(Array)

        expect(movies[:results].first).to have_key :overview
        expect(movies[:results].first[:overview]).to be_a(String)

        expect(movies[:results].first).to have_key :vote_average
        expect(movies[:results].first[:vote_average]).to be_a(Float)

        expect(movies[:results].count).to eq(20)
      end
    end

    context "#search(search_params)" do
      it "searches for a movie", :vcr do
        movies = MovieService.search("Princess")
        expect(movies).to be_a Hash
        expect(movies[:results]).to be_a Array

        movies[:results].each do |movie|
          expect(movie[:title]).to include("Princess")
        end
        expect(movies[:results].count <= 20).to be(true)
      end
    end
  end

  context "instance methods" do
    context "#get_credits(tmdb_id)" do
      it 'gets credits information for a movie', :vcr do
        movie = MovieService.new
        movie = movie.get_credits(808)
        expect(movie).to be_a Hash
        expect(movie[:cast]).to be_a Array

        movie[:cast].each do |cast|
          expect(cast).to have_key :name
          expect(cast[:name]).to be_a(String)
          expect(cast).to have_key :character
          expect(cast[:character]).to be_a(String)
        end
      end
    end

    context "#get_reviews(tmdb_id)" do
      it 'gets reviews for a movie', :vcr do
        movie = MovieService.new
        movie = movie.get_reviews(808)
        expect(movie).to be_a Hash
        expect(movie[:results]).to be_a Array

        movie[:results].each do |review|
          expect(review).to have_key :author
          expect(review[:author]).to be_a(String)
          expect(review).to have_key :content
          expect(review[:content]).to be_a(String)
        end
      end
    end

    context "#get_details(tmdb_id)" do
      it 'gets details for a movie', :vcr do
        movie = MovieService.new
        movie = movie.get_details(808)
        expect(movie).to be_a Hash

        expect(movie).to have_key :title
        expect(movie[:title]).to be_a(String)

        expect(movie).to have_key :genres
        expect(movie[:genres]).to be_a(Array)

        expect(movie).to have_key :overview
        expect(movie[:overview]).to be_a(String)

        expect(movie).to have_key :vote_average
        expect(movie[:vote_average]).to be_a(Float)
      end 
    end

    context "#details_conn(tmdb_id)" do
      it 'gets connection details for a movie', :vcr do
        movie = MovieService.new
        conn = movie.details_conn(808)
        expect(conn).to be_a(Faraday::Connection)
      end
    end

    context "#credits_conn(tmdb_id)" do
      it 'gets connection credits for a movie', :vcr do
        movie = MovieService.new
        conn = movie.credits_conn(808)
        expect(conn).to be_a(Faraday::Connection)
      end
    end

    context "#reviews_conn(tmdb_id)" do
      it 'gets connection reviews for a movie', :vcr do
        movie = MovieService.new
        conn = movie.reviews_conn(808)
        expect(conn).to be_a(Faraday::Connection)
      end
    end

    context "#all_details(tmdb_id)" do
      it 'gets all details for a movie', :vcr do
        movie = MovieService.new
        movie = movie.all_details(808)
        expect(movie).to be_a Hash
        expect(movie[:details]).to have_key :title
        expect(movie[:details][:title]).to be_a(String)

        expect(movie[:details]).to have_key :genres
        expect(movie[:details][:genres]).to be_a(Array)

        expect(movie[:details]).to have_key :overview
        expect(movie[:details][:overview]).to be_a(String)

        expect(movie[:details]).to have_key :vote_average
        expect(movie[:details][:vote_average]).to be_a(Float)
        expect(movie[:credits].first).to have_key :name
        expect(movie[:credits].first[:name]).to be_a(String)

        expect(movie[:credits].first).to have_key :character
        expect(movie[:credits].first[:character]).to be_a(String)

        expect(movie[:reviews].first).to have_key :author
        expect(movie[:reviews].first[:author]).to be_a(String)

        expect(movie[:reviews].first).to have_key :content
        expect(movie[:reviews].first[:content]).to be_a(String)
      end 
    end

  end
end