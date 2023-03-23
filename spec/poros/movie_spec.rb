require 'rails_helper'
require './app/poros/movie'
require './app/services/movie_service'

RSpec.describe Movie do
  before :each do
    json_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=#{ENV['MOVIE_DB_KEY']}")

    @movie = Movie.new(JSON.parse(json_response, symbolize_names: true))
  end

  it 'exists and has attributes' do
    expect(@movie).to be_a(Movie)
    expect(@movie.title).to eq('Fight Club')
    expect(@movie.id).to eq(550)
    expect(@movie.summary).to be_a(String)
    expect(@movie.vote_average).to eq(8.432)
    expect(@movie.vote_count).to eq(26052)
    expect(@movie.image_url).to eq("/hZkgoQYus5vegHoetLkCJzb17zJ.jpg")
  end
end