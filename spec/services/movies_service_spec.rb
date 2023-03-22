require 'rails_helper'

RSpec.describe MoviesService do

  it "creates a Faraday connection to the URL https://api.themoviedb.org/3/" do 
    expect(MoviesService.connection).to be_an_instance_of(Faraday::Connection)
  end

  it "returns a JSON hash from the input" do 
    VCR.use_cassette("top_rated_movies") do
      expect(MoviesService.fetch_api("movie/top_rated?api_key=#{ENV['MoviesDB_API_KEY']}&language=en-US&page=1")).to be_a(Hash)
    end
  end

end