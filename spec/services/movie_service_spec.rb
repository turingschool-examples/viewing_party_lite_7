require "rails_helper"

RSpec.describe MovieService do
  describe "instance methods" do
    context "#get top movies" do
      it "returns top movies data", :vcr do
        search = MovieService.new.find_top_movies

        expect(search).to be_a(Hash)
        expect(search[:results]).to be_an(Array)

        movie_data = search[:results].first

        expect(movie_data).to have_key(:id)
        expect(movie_data[:id]).to be_an(Integer)

        expect(movie_data).to have_key(:title)
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key(:vote_average)
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end

    context "#search movies by keyword" do
      it "returns movie data based on keyword", :vcr do
        search = MovieService.new.search_movies_by_keyword("Princess")

        expect(search).to be_a(Hash)
        expect(search[:results]).to be_an(Array)

        movie_data = search[:results].first

        expect(movie_data).to have_key(:id)
        expect(movie_data[:id]).to be_an(Integer)

        expect(movie_data).to have_key(:title)
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key(:vote_average)
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end

    context "#movie_details", :vcr do
      it "returns details about a movie" do
        search = MovieService.new.movie_details(238)

        expect(search).to be_a(Hash)
        expect(search).to have_key(:id)
        expect(search[:id]).to be_an(Integer)

        expect(search).to have_key(:title)
        expect(search[:title]).to be_a(String)

        expect(search).to have_key(:vote_average)
        expect(search[:vote_average]).to be_a(Float)

        expect(search).to have_key(:overview)
        expect(search[:overview]).to be_a(String)

        expect(search).to have_key(:genres)
        expect(search[:genres]).to be_an(Array)

        expect(search).to have_key(:runtime)
        expect(search[:runtime]).to be_an(Integer)

        expect(search).to have_key(:poster_path)
        expect(search[:poster_path]).to be_a(String)
      end
    end

    context "#movie_credits", :vcr do
      it "returns first 10 movie credits" do
        search = MovieService.new.movie_credits(238)
        credits = search[:cast]

        expect(credits.count).to eq(10)
        expect(credits.first[:name]).to be_a(String)
        expect(credits.first[:name]).to eq("Marlon Brando")
        expect(credits.first[:character]).to be_a(String)
        expect(credits.first[:character]).to eq("Don Vito Corleone")
      end
    end

    context "#movie_reviews", :vcr do
      it "returns all reviews for that movie" do
        search = MovieService.new.movie_reviews(238)
        reviews = search[:results]

        expect(reviews).to be_an(Array)
        expect(reviews.count).to eq(5)
        expect(reviews.first[:author]).to eq("futuretv")
        expect(reviews.first[:author]).to be_a(String)
        expect(reviews.first[:content]).to be_a(String)
      end
    end
  end
end
