require 'rails_helper'

describe MovieService do
  it "returns movie data", :vcr do

    search = MovieService.top_rated

    expect(search).to be_a Hash
    expect(search[:results]).to be_an Array
    movie_data = search[:results].first
  
    expect(movie_data).to have_key :id
    expect(movie_data[:id]).to be_a(Integer)

    expect(movie_data).to have_key :poster_path
    expect(movie_data[:poster_path]).to be_a(String)

    expect(search[:results].count).to eq(20)
  end
  
end