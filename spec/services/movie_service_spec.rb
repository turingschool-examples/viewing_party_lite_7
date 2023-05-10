require 'rails_helper'

RSpec.describe MovieService do
  #here is where we should do a before all block as we build out more tests
  it 'can create a connection, and consume the api', :vcr do
    top_rated = MovieService.top_rated_movies
  
    expect(top_rated).to be_a(Hash)
    expect(top_rated[:results]).to be_an(Array)
    expect(top_rated[:results].first[:title]).to be_a(String)
    expect(top_rated[:results].first[:title]).to eq('The Godfather')
  end
end