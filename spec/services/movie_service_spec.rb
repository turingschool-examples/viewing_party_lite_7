require "rails_helper"

describe MovieService do
  describe "#top_rated_movies" do
    before(:each) do
      VCR.use_cassette(:top_rated_movies, serialize_with: :json) do
        @api_call_result = MovieService.new.top_rated_movies
        @top_rated_movies = @api_call_result[:results]
      end
    end

    it "returns all expected attributes and data types" do
      expect(@top_rated_movies).to be_a(Array)

      expect(@top_rated_movies.first).to have_key(:id)
      expect(@top_rated_movies.first[:id]).to be_a(Integer)

      expect(@top_rated_movies.first).to have_key(:title)
      expect(@top_rated_movies.first[:title]).to be_a(String)

      expect(@top_rated_movies.first).to have_key(:vote_average)
      expect(@top_rated_movies.first[:vote_average]).to be_a(Float)
    end

    it "returns the top 20 rated moves" do
      expect(@top_rated_movies.count).to eq(20)
      expect(@top_rated_movies.first[:title]).to eq("Spider-Man: Across the Spider-Verse")
      expect(@top_rated_movies.first[:vote_average]).to eq(8.8)
    end
  end

  describe "#movie_by_id" do
    before(:each) do
      VCR.eject_cassette(:movie_by_id_info)
    end

    it "returns all expected attributes and data types" do
      VCR.insert_cassette(:movie_by_id_info, serialize_with: :json) do
        @movie = MovieService.new.movie_by_id(550)
      
        expect(@movie).to be_a(Hash)

        expect(@movie).to have_key(:genres)
        expect(@movie[:genres]).to be_a(Array)

        expect(@movie).to have_key(:overview)
        expect(@movie[:overview]).to be_a(String)

        expect(@movie).to have_key(:id)
        expect(@movie[:id]).to be_a(Integer)

        expect(@movie).to have_key(:title)
        expect(@movie[:title]).to be_a(String)

        expect(@movie).to have_key(:vote_average)
        expect(@movie[:vote_average]).to be_a(Float)

        expect(@movie).to have_key(:runtime)
        expect(@movie[:runtime]).to be_a(Integer)

        expect(@movie).to have_key(:poster_path)
        expect(@movie[:poster_path]).to be_a(String)
      end
    end

    it "returns the correct movie" do
      VCR.insert_cassette(:movie_by_id_info, serialize_with: :json) do
        @movie = MovieService.new.movie_by_id(550)
        
        expect(@movie[:title]).to eq("Fight Club")
      end
    end
  end

  describe "#cast" do
    before(:each) do
      VCR.use_cassette(:cast_info, serialize_with: :json) do
        @movie = MovieService.new.movie_cast(550)
        @cast = @movie[:cast]
      end
    end

    it "returns all expected attributes and data types" do
      expect(@cast).to be_a(Array)

      expect(@cast.first).to have_key(:name)
      expect(@cast.first[:name]).to be_a(String)

      expect(@cast.first).to have_key(:character)
      expect(@cast.first[:character]).to be_a(String)
    end
  end
end
