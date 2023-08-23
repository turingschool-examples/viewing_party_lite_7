require "rails_helper"

RSpec.describe MoviesService do
  it "can connect to movie db" do
    require 'pry'; binding.pry
    get "https://api.themoviedb.org/" # pass API key

    expect(response).to have_http_status(:success)
  end

  it "can retrieve top 20 movies" do
    # top_rated&include_adult=false
  end

  it "can retrieve a specific movie" do

  end

  it "can retrieve a specific movie's reviews" do

  end

  it "can retrieve a specific movie's cast" do

  end
end