require 'rails_helper'

RSpec.describe DiscoverMovie do
  it "exists" do
    attributes = {
      :name=>"Batman",
      :vote_average=>7,
      :runtime=>nil,
      :genre=>[13],
      :summary=>"A rich guy with a dark private life",
      :top_10=>nil,
      :total_reviews=>100,
      :review_authors=>nil
    }
   
    movie = DiscoverMovie.new(attributes)
require 'pry';binding.pry
    expect(movie).to be_a(DiscoverMovie)
    expect(movie.name).to eq("Batman")
    expect(movie.vote_average).to eq(7)
    expect(movie.runtime).to be nil
    expect(movie.genre).to eq([13])
    expect(movie.summary).to eq("A rich guy with a dark private life")
    expect(movie.top_10).to be nil
    expect(movie.total_reviews).to eq(100)
    expect(movie.review_authors).to be nil
  end
end