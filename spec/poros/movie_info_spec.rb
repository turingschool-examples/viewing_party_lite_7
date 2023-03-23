require 'rails_helper'

RSpec.describe MovieInfo do
  describe "creates an object from the movie api" do
    before :each do
      response = File.read("spec/fixtures/get_movie.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/119")
        .with(headers: {
        'X-API-KEY' => ENV['TMDB_KEY']
        })
        .to_return(status: 200, body: response, headers: {})
        
      @movie = MovieInfo.new(JSON.parse(response, symbolize_names: true))
    end
    
    it "exists and has attributes" do
      # binding.pry
      
      expect(@movie.title).to eq("The Lord of the Rings: The Return of the King")
      expect(@movie.runtime).to eq(201)
      expect(@movie.summary).to be_a(String)
      expect(@movie.vote_avg).to eq(8.474)
    end
  end
  
end