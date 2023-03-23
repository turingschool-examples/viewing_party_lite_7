require 'rails_helper'

RSpec.describe MovieFacade do
  let!(:movie_facade) { MovieFacade.new }
  
  before :each do
    response = File.read("spec/fixtures/get_movie.json")
    stub_request(:get, "https://api.themoviedb.org/3/movie/119")
      .with(headers: {
      'X-API-KEY' => ENV['TMDB_KEY']
      })
      .to_return(status: 200, body: response, headers: {})
  end
  
  it 'exists' do
    expect(movie_facade).to be_a(MovieFacade)
  end
  
  it 'has attributes' do
    movie = MovieFacade.get_movie(119)
    
    expect(movie.title).to eq("The Lord of the Rings: The Return of the King")
    # expect(movie.genre).to be_an(Array)
    expect(movie.runtime).to eq(201)
    expect(movie.summary).to be_a(String)
    expect(movie.vote_avg).to eq(8.474)
  end
  
end