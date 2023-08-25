require 'rails_helper'

describe TmdbService do
  describe "instance methods" do
    describe "#top_rated_movies" do
      it "returns top rated movies", :vcr do
        search = TmdbService.new.top_rated_movies
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movies_data = search[:results].first

        expect(movies_data).to have_key :id
        expect(movies_data[:id]).to be_a(Integer)

        expect(movies_data).to have_key :title
        expect(movies_data[:title]).to be_a(String)

        expect(movies_data).to have_key :vote_average
        expect(movies_data[:vote_average]).to be_a(Float)
      end
    end
  end

  describe "#search_movies" do
    it "returns search movies", :vcr do
      search = TmdbService.new.search_movies("pulp fiction")
      expect(search).to be_a Hash
      expect(search[:results]).to be_an Array
      movies_data = search[:results].first

      expect(movies_data).to have_key :id
      expect(movies_data[:id]).to be_a(Integer)

      expect(movies_data).to have_key :title
      expect(movies_data[:title]).to be_a(String)

      expect(movies_data).to have_key :vote_average
      expect(movies_data[:vote_average]).to be_a(Float)
    end
  end

  describe "#movie_details" do
    it "returns search movies", :vcr do
      search = TmdbService.new.movie_details(680)
      expect(search).to be_a Hash
      movies_data = search

      expect(movies_data).to have_key :id
      expect(movies_data[:id]).to be_a(Integer)

      expect(movies_data).to have_key :title
      expect(movies_data[:title]).to be_a(String)

      expect(movies_data).to have_key :overview
      expect(movies_data[:overview]).to be_a(String)

      expect(movies_data).to have_key :runtime
      expect(movies_data[:runtime]).to be_a(Integer)

      expect(movies_data).to have_key :poster_path
      expect(movies_data[:poster_path]).to be_a(String)

      expect(movies_data).to have_key :genres
      expect(movies_data[:genres]).to be_an(Array)
    end
  end

  describe "#movie_cast" do
    it "returns movie cast", :vcr do
      search = TmdbService.new.movie_cast(680)
      expect(search).to be_a Hash
      expect(search[:cast]).to be_an Array
      movies_data = search[:cast].first

      expect(movies_data).to have_key :id
      expect(movies_data[:id]).to be_a(Integer)

      expect(movies_data).to have_key :name
      expect(movies_data[:name]).to be_a(String)

      expect(movies_data).to have_key :character
      expect(movies_data[:character]).to be_a(String)
    end
  end

  describe "#movie_reviews" do
    it "returns movie reviews", :vcr do
      search = TmdbService.new.movie_reviews(680)
      expect(search).to be_a Hash
      expect(search[:results]).to be_an Array
      movies_data = search[:results].first

      expect(movies_data).to have_key :id
      expect(movies_data[:id]).to be_a(String)

      expect(movies_data).to have_key :author
      expect(movies_data[:author]).to be_a(String)

      expect(movies_data).to have_key :content
      expect(movies_data[:content]).to be_a(String)
    end
  end
end