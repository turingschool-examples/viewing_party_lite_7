require "rails_helper"

RSpec.describe Movie do 
 it "exists" do 
  attrs = {original_title: "Scary Movie 2", vote_average: 8.0}

  movie = Movie.new(attrs)

  expect(movie).to be_a Movie 
  expect(movie.title).to eq("Scary Movie 2") #WHY No PASS?
  expect(movie.vote_average).to eq(8.0)
 end
end