require "rails_helper"

RSpec.describe MovieFacade do
  before(:each) do
    @facade = MovieFacade.new(155)
  end
  describe "class methods", :vcr do
    it "has poster path" do
      expect(@facade.poster).to eq("https://image.tmdb.org/t/p/original/qJ2tW6WMUDux911r6m7haRef0WH.jpg")
      expect(@facade.poster).to be_a String
    end

    it "can get movie poster" do
      expect(MovieFacade.get_movie_poster(155)).to be_a(String)
    end

    it "can get movie title" do
      expect(MovieFacade.get_movie_title(155)).to be_a(String)
    end

    it "has movie id" do
      expect(@facade.movie_id).to eq(155)
    end

    it "has movie title" do
      expect(@facade.movie_title).to eq("The Dark Knight")
    end

    it "has vote average" do
      expect(@facade.vote_average).to be_a Float || Integer
    end

    it "has runtime" do
      expect(@facade.runtime).to eq(152)
    end

    it "has genres" do
      expect(@facade.genres).to eq("Drama, Action, Crime, Thriller")
    end

    it "has summary" do
      expect(@facade.summary).to be_a String
    end
  end

  describe "reviews", :vcr do
    it "has reviews" do
      expect(@facade.reviews).to be_an Array
      expect(@facade.reviews.first).to be_a Review
      expect(@facade.reviews.first.author).to be_a String
      expect(@facade.reviews.first.content).to be_a String
    end
  end

  describe "cast", :vcr do
    it "has cast" do
      expect(@facade.cast).to be_an Array
      expect(@facade.cast.first).to be_a Cast
      expect(@facade.cast.first.name).to be_a String
      expect(@facade.cast.first.character).to be_a String
    end
  end
end
