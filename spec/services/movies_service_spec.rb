require 'rails_helper'

RSpec.describe MoviesService do

  it "creates a Faraday connection to the URL https://api.themoviedb.org/3/" do 
    expect(MoviesService.connection).to be_an_instance_of(Faraday::Connection)
    expect(MoviesService.connection.url_prefix.to_s).to include("https://api.themoviedb.org/3/")
  end

  it "returns a JSON hash from the input with information about the top rated movies" do 
    VCR.use_cassette("top_rated_movies", :allow_playback_repeats => true) do
      results = MoviesService.fetch_api("movie/top_rated?api_key=#{ENV['MoviesDB_API_KEY']}&language=en-US&page=1")
      expect(results).to be_a(Hash)
      expect(results[:results]).to be_a(Array)
      expect(results[:results].count).to eq(20)
      required_keys = %i[id original_title overview vote_average]

      expect(results[:results].first).to include(*required_keys)
    end
  end

  it "returns a JSON hash with results about that individual movie" do  
    VCR.use_cassette("movie_id_238", :allow_playback_repeats => true) do
      movie_id = "238"
      results = MoviesService.fetch_api("movie/#{movie_id}?api_key=#{ENV['MoviesDB_API_KEY']}&language=en-US")
      expect(results).to be_a(Hash)
      required_keys = %i[id genres overview vote_average original_title runtime]

      expect(results).to include(*required_keys)
    end
  end

  it "returns a JSON has with cast information about the cast  members" do 
    VCR.use_cassette("movie_id_238_cast_members", :allow_playback_repeats => true) do
      movie_id = "238"
      results = MoviesService.fetch_api("movie/#{movie_id}/credits?api_key=#{ENV['MoviesDB_API_KEY']}&language=en-US")
      expect(results).to be_a(Hash)
      expect(results[:cast]).to be_a(Array)
      required_keys = %i[adult gender id cast_id name character]
      expect(results[:cast].first).to include(*required_keys)
    end

  end

  it "returns a JSON with information about the reviewers" do 
    VCR.use_cassette("movie_id_238_reviews", :allow_playback_repeats => true) do
      movie_id = "238"
      results = MoviesService.fetch_api("movie/#{movie_id}/reviews?api_key=#{ENV['MoviesDB_API_KEY']}&language=en-US")
      expect(results).to be_a(Hash)
      required_keys = %i[total_results]
      expect(results).to include(*required_keys)
      require 'pry'; binding.pry
      required_keys_array = %i[author]
      expect(results[:results]).to be_a(Array)
      expect(results[:results].first).to include(*required_keys_array)
    end

  end

end