require "rails_helper"

RSpec.describe MovieFacade do
  let(:params) { { id: 120, user_id: 1, commit: "Find Movies", search: "The ring" } }
  let(:facade) { MovieFacade.new(params) }

  before(:each) do
    # This stubs out the API call to the top rated movies endpoint
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}")
      .to_return(status: 200, body: File.read("./spec/fixtures/top_rated_movies.json"))

    # This stubs out the API call to the movie search endpoint
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&query=The%20ring")
      .to_return(status: 200, body: File.read("./spec/fixtures/search_movies.json"))

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

  describe "#initialize" do
    it "initializes with attributes" do
      expect(facade).to be_a MovieFacade
      expect(facade.movie_id).to eq(120)
      expect(facade.user_id).to eq(1)
      expect(facade.commit).to eq("Find Movies")
      expect(facade.title).to eq("The ring")
    end
  end

  describe "#user" do
    it "returns the user fetched from User service" do
      expect(User).to receive(:find).with(1).and_return(User.new)
      expect(facade.user).to be_a(User)
    end
  end

  describe "#movies" do
    context "when commit is 'Find Movies'" do
      it "calls movie_search with the given title" do
        expect(facade).to receive(:movie_search).with("The ring")
        facade.movies
      end
    end

    context "when commit is not 'Find Movies'" do
      let(:params) { { id: 1, user_id: 1, commit: "Other", search: "The ring" } }

      it "calls top_rated_movies" do
        expect(facade).to receive(:top_rated_movies)
        facade.movies
      end
    end
  end

  describe "#top_rated_movies" do
    it "returns an array of Movie instances" do
      expect(facade.top_rated_movies.all? { |movie| movie.is_a?(Movie) }).to be true
    end
  end

  describe "#movie_search" do
    it "returns an array of Movie instances" do
      expect(facade.movie_search("The ring").all? { |movie| movie.is_a?(Movie) }).to be true
    end
  end

  describe "#movie_details" do
    it "returns a Movie instance" do
      expect(facade.movie_details).to be_a(Movie)
    end
  end

  describe "#movie_title" do
    it "returns the title of the movie" do
      expect(facade.movie_title).to eq("The Lord of the Rings: The Fellowship of the Ring")
    end
  end

  describe "#movie_rating" do
    it "returns the rating of the movie" do
      expect(facade.movie_rating).to be_a(Numeric)
    end
  end

  describe "#movie_runtime" do
    it "returns the runtime of the movie in the format 'Xhr Ymin'" do
      expect(facade.movie_runtime).to match(/\A\d+hr \d+min\z/)
    end
  end

  describe "#movie_genre" do
    it "returns a comma-separated string of genres" do
      expect(facade.movie_genre).to be_a(String)
    end
  end

  describe "#movie_summary" do
    it "returns the summary of the movie" do
      expect(facade.movie_summary).to be_a(String)
    end
  end

  describe "#first_ten_cast" do
    it "returns a Hash representing the cast of the movie" do
      expect(facade.first_ten_cast).to be_a(Hash)
    end
  end

  describe "#movie_cast" do
    it "returns an array of strings representing the movie cast" do
      expect(facade.movie_cast.all? { |cast| cast.is_a?(String) }).to be true
    end
  end

  describe "#all_reviews" do
    it "returns a Hash representing all reviews of the movie" do
      expect(facade.all_reviews).to be_a(Hash)
    end
  end

  describe "#movie_reviews" do
    it "returns an array of strings representing the movie reviews" do
      expect(facade.movie_reviews.all? { |review| review.is_a?(String) }).to be true
    end
  end

  describe "#number_of_reviews" do
    it "returns the number of reviews of the movie" do
      expect(facade.number_of_reviews).to be_a(Numeric)
    end
  end

  describe "#find_by_id" do
    it "returns a Hash representing the movie details" do
      expect(facade.find_by_id(120)).to be_a(Hash)
    end
  end
end
