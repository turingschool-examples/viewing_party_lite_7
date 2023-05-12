require 'rails_helper'

RSpec.describe Movie do
  let!(:movie) { Movie.new(id: 1, title: "Love Hard", vote_average: 7.0) }

  it "exists" do
    expect(movie).to be_a(Movie)
  end

  context "critic really likes this movie" do
    it "title is a mashup of two other movies" do
      expect(movie.title).to eq("Love Hard")
    end

    it "truly isn't that bad" do
      expect(movie.vote_average).to eq(7.0)
    end
  end
end