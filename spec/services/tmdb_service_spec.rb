require 'rails_helper'

RSpec.describe TmdbService do
  let(:top_rated) { TmdbService.top_rated_movies(1) }

  it 'can create a connection, and consume the api', :vcr do
    expect(top_rated).to be_a(Hash)
    expect(top_rated[:results]).to be_an(Array)
    expect(top_rated[:results].first[:title]).to be_a(String)
    expect(top_rated[:results].first[:title]).to eq('The Godfather')
  end
end