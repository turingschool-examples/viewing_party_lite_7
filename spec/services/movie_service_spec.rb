require "rails_helper"

RSpec.describe MovieService do
  describe "search" do
    it "returns search results by movie title", :vcr do
      movie_service = MovieService.new

      princess_movies = movie_service.search("Princess")[:results]

      expect(princess_movies).to be_an(Array)
    end
  end

  describe "top_rated" do
    it 'returns top rated movies', :vcr do
      movie_service = MovieService.new

      top_rated_movies = movie_service.top_rated[:results]

      expect(top_rated_movies).to be_an(Array)
      expect(top_rated_movies.count).to eq(20)
    end
  end

  describe "find movie" do  
    it "returns a movie by id", :vcr do
      movie_service = MovieService.new

      star_wars = movie_service.find_movie(11)

      expect(star_wars).to be_a(Hash)
      expect(star_wars).to have_key(:id)
      expect(star_wars[:id]).to eq(11)
      expect(star_wars).to have_key(:title)
      expect(star_wars[:title]).to be_a(String)
      expect(star_wars).to have_key(:vote_average)
      expect(star_wars[:vote_average]).to be_a(Float)
      expect(star_wars).to have_key(:runtime)
      expect(star_wars[:runtime]).to be_a(Integer)
      expect(star_wars).to have_key(:genres)
      expect(star_wars[:genres]).to be_an(Array)
      expect(star_wars).to have_key(:overview)
      expect(star_wars[:overview]).to be_a(String)
      expect(star_wars).to have_key(:poster_path)
      expect(star_wars[:poster_path]).to be_a(String)
    end
  end

  describe "reviews" do
    it "returns reviews for a movie", :vcr do
      movie_service = MovieService.new

      star_wars_reviews = movie_service.reviews(11)[:results]

      expect(star_wars_reviews).to be_an(Array)
      expect(star_wars_reviews.first).to have_key(:author)
      expect(star_wars_reviews.first[:author]).to be_a(String)
      expect(star_wars_reviews.first).to have_key(:content)
      expect(star_wars_reviews.first[:content]).to be_a(String)
      expect(star_wars_reviews.first[:author_details]).to have_key(:rating)
      expect(star_wars_reviews.first[:author_details][:rating]).to be_a(Float).or be_nil
    end
  end

  describe "cast" do
    it "returns cast for a movie", :vcr do
      movie_service = MovieService.new

      star_wars_cast = movie_service.cast(11)[:cast]

      expect(star_wars_cast).to be_an(Array)
      expect(star_wars_cast.first).to have_key(:name)
      expect(star_wars_cast.first[:name]).to be_a(String)
      expect(star_wars_cast.first).to have_key(:character)
      expect(star_wars_cast.first[:character]).to be_a(String)
    end
  end
end