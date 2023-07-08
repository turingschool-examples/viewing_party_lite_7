require "rails_helper"

RSpec.describe MovieService do
  before(:each) do
    # This stubs out the API call to the top rated movies endpoint
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}")
      .to_return(status: 200, body: File.read("./spec/fixtures/top_rated_movies.json"))

    # This stubs out the API call to the movie search endpoint
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&query=The%20ring")
      .to_return(status: 200, body: File.read("./spec/fixtures/search_movie.json"))

    # This stubs out the API call to the movie details endpoint
    stub_request(:get, "https://api.themoviedb.org/3/movie/120?api_key=#{ENV['MOVIE_API_KEY']}")
      .to_return(status: 200, body: File.read("./spec/fixtures/lord_of_the_rings_fellowship/details.json"))

    # This stubs out the API call to the movie credits endpoint
    stub_request(:get, "https://api.themoviedb.org/3/movie/120/credits?api_key=#{ENV['MOVIE_API_KEY']}")
      .to_return(status: 200, body: File.read("./spec/fixtures/lord_of_the_rings_fellowship/credits.json"))

    # This stubs out the API call to the movie reviews endpoint
    stub_request(:get, "https://api.themoviedb.org/3/movie/120/reviews?api_key=#{ENV['MOVIE_API_KEY']}")
      .to_return(status: 200, body: File.read("./spec/fixtures/lord_of_the_rings_fellowship/reviews.json"))
  end

  describe "class methods" do
    it ".conn" do
      conn = MovieService.conn

      expect(conn).to be_a(Faraday::Connection)
      expect(conn.params["api_key"]).to eq(ENV["MOVIE_API_KEY"])
    end

    it "#get_url" do
      url = MovieService.get_url("movie/top_rated")

      expect(url).to be_a(Hash)
      expect(url[:results]).to be_a(Array)
      expect(url[:results].first).to have_key(:title)
    end

    it "#top_rated_movies" do
      movies = MovieService.top_rated_movies

      expect(movies).to be_a(Hash)
      expect(movies[:results]).to be_an(Array)
      expect(movies[:results].count).to eq(20)
      expect(movies[:results].first).to be_a(Hash)
      expect(movies[:results].first[:title]).to eq("The Godfather")
    end

    it "#movie_search" do
      movies = MovieService.movie_search("The ring")

      expect(movies).to be_a(Hash)
      expect(movies[:results]).to be_a(Array)
      expect(movies[:results].first).to be_a(Hash)
      expect(movies[:results].first[:title]).to eq("The Ring")
    end

    it "#find_by_id" do
      movie = MovieService.find_by_id(120)

      expect(movie).to be_a(Hash)
      expect(movie[:title]).to eq("The Lord of the Rings: The Fellowship of the Ring")
    end

    it "#cast_by_id" do
      cast = MovieService.cast_by_id(120)

      expect(cast).to be_a(Hash)
      expect(cast[:cast]).to be_an(Array)
      expect(cast[:cast].first).to be_a(Hash)
      expect(cast[:cast].first[:name]).to eq("Elijah Wood")
    end

    it "#reviews_by_id" do
      reviews = MovieService.reviews_by_id(120)

      expect(reviews).to be_a(Hash)
      expect(reviews[:results]).to be_an(Array)
      expect(reviews[:results].first).to be_a(Hash)
      expect(reviews[:results].first[:author]).to eq("NeoBrowser")
    end
  end
end
