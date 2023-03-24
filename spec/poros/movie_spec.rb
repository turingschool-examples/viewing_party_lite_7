require "rails_helper"

RSpec.describe Movie do 
  before(:each) do 
    attrs = {original_title: "Scary Movie 2", vote_average: 8.0}
    @movie = Movie.new(attrs)
    details_file = File.read("./spec/fixtures/movies/get_movie_details.json")
    reviews_file = File.read("./spec/fixtures/movies/reviews_call.json")
    credits_file = File.read("./spec/fixtures/movies/credits_call.json")
    @parsed_data = JSON.parse(details_file, symbolize_names: true)
    @review_data = JSON.parse(reviews_file, symbolize_names: true)
    @credit_data = JSON.parse(credits_file, symbolize_names: true)
  end

  describe "movie", :vcr do 
    it "exists" do 
      expect(@movie).to be_a Movie 
      expect(@movie.title).to eq("Scary Movie 2")
      expect(@movie.vote_average).to eq(8.0)
    end

    it "can get details" do 
      expect(@movie.get_details(@parsed_data)).to be_a(Hash)
    end


    it "can get reviews" do 
      expect(@movie.get_reviews(@review_data)).to be_a(Hash)
    end

    it "can get reviews" do 
      expect(@movie.get_credits(@credit_data)).to be_a(Hash)
    end
  end
end