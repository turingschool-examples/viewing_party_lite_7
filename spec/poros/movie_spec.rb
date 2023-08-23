require "rails_helper"

RSpec.describe Movie do
  #set up VCR and change before block 
  before do
    connection = MoviesService.new.connection
    response = connection.get("3/movie/234") do |f|
      f.params["append_to_response"] = "reviews,credits"
    end
    @movie = Movie.new(JSON.parse(response.body))
  end

  it "has an id" do

  end

  it "has a title" do

  end

  it "has a vote average" do

  end

  it "has a runtime" do

  end

  it "has genres" do

  end

  it "can format genres" do

  end

  it "has a summary" do

  end

  it "has an array of ten cast members" do

  end

  it "formats cast members into an array with maximum 10" do

  end

  it "can count total reviews" do

  end

  it "stores reviews with author, rating, and comments" do

  end
end