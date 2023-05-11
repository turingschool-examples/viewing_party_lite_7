require 'rails_helper'

RSpec.describe Movie do
  before(:each) do
    test_movie
  end
  it "exists and has attributes" do
    movie = Movie.new(@data)
    expect(movie).to be_a Movie
    expect(movie.title).to eq("Fight Club")
    expect(movie.id).to eq(550)
    expect(movie.vote_average).to eq(8.433)
  end
end
