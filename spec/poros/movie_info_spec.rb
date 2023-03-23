require 'rails_helper'

RSpec.describe MovieInfo do
  describe "creates an object from the movie api" do
    before :each do
      lotr = File.read("spec/fixtures/get_movie.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/119")
        .with(headers: {
        'X-API-KEY' => ENV['TMDB_KEY']
        })
        .to_return(status: 200, body: lotr, headers: {})
        
      pb = File.read("spec/fixtures/get_movie2.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/119")
        .with(headers: {
        'X-API-KEY' => ENV['TMDB_KEY']
        })
        .to_return(status: 200, body: pb, headers: {})
        
      @movie  = MovieInfo.new(JSON.parse(lotr, symbolize_names: true))
      @movie2 = MovieInfo.new(JSON.parse(pb, symbolize_names: true))
    end
    
    it "exists and has attributes" do
      expect(@movie).to be_a(MovieInfo)
      expect(@movie.title).to eq("The Lord of the Rings: The Return of the King")
      expect(@movie.runtime).to eq(201)
      expect(@movie.summary).to be_a(String)
      expect(@movie.vote_avg).to eq(8.474)
      expect(@movie.genre).to be_an(Array)
    end
    
    it "can parse genres from the genre array" do
      expect(@movie.list_genres).to eq(["Adventure", "Fantasy", "Action"]) #LOTR
      expect(@movie2.list_genres).to eq(["Adventure", "Family", "Fantasy", "Comedy", "Romance"]) #Princess Bride
    end
  end  
end