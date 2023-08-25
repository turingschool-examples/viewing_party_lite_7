require "rails_helper"

RSpec.describe MovieService do
  describe "movie service", :vcr do 
    it "returns top rated movies" do
      movie_service = MovieService.new
      top_rated_movies = movie_service.top_rated[:results]
      
      expect(top_rated_movies).to be_an(Array)
      expect(top_rated_movies.count).to eq(20)
    end

    it "returns search results" do
      movie_service = MovieService.new
      search_results = movie_service.search("The Godfather")[:results]

      expect(search_results).to be_an(Array)
    end

    it "find movie by id" do
      movie_service = MovieService.new
      godfather = movie_service.find_movie(238)

      expect(godfather).to be_a(Hash)
      expect(godfather).to have_key(:title)
      expect(godfather[:title]).to be_a(String)
      expect(godfather).to have_key(:vote_average)
      expect(godfather[:vote_average]).to be_a(Float)
      expect(godfather).to have_key(:runtime)
      expect(godfather[:runtime]).to be_a(Integer)
      expect(godfather).to have_key(:genres)
      expect(godfather[:genres]).to be_an(Array)
      expect(godfather[:genres][0]).to have_key(:name)
      expect(godfather[:genres][0][:name]).to be_a(String)
      expect(godfather).to have_key(:overview)
      expect(godfather[:overview]).to be_a(String)
      expect(godfather).to have_key(:poster_path)
      expect(godfather[:poster_path]).to be_a(String)
    end

    it "returns reviews" do
      movie_service = MovieService.new
      godfather_reviews = movie_service.reviews(238)[:results]

      expect(godfather_reviews).to be_an(Array)
      expect(godfather_reviews.first).to have_key(:author)
      expect(godfather_reviews.first[:author]).to be_a(String)
      expect(godfather_reviews.first).to have_key(:content)
      expect(godfather_reviews.first[:content]).to be_a(String)
      expect(godfather_reviews.first[:author_details]).to have_key(:rating)
      expect(godfather_reviews.first[:author_details][:rating]).to be_a(Float)
    end

    it "returns cast" do
      movie_service = MovieService.new
      godfather_cast = movie_service.cast(238)[:cast]

      expect(godfather_cast).to be_an(Array)
      expect(godfather_cast.first).to have_key(:name)
      expect(godfather_cast.first[:name]).to be_a(String)
      expect(godfather_cast.first).to have_key(:character)
      expect(godfather_cast.first[:character]).to be_a(String)
    end
  end
end