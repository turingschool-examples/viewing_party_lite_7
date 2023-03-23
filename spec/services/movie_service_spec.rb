require 'rails_helper'

RSpec.describe MovieService do
  before :each do
    movie = File.read("spec/fixtures/get_movie.json")
    
    stub_request(:get, "https://api.themoviedb.org/3/movie/122")
      .with(headers: {
        'X-API-KEY' => ENV['TMDB_KEY']
        })
      .to_return(status: 200, body: movie, headers: {})
  end
  
  it 'returns a movie with a given ID' do
    #webmock test
    id = 122
    movie = MovieService.get_movie(id)
    
    expect(movie).to be_a(Hash)
    expect(movie[:original_title]).to eq("The Lord of the Rings: The Return of the King")
    expect(movie).to have_key(:id)
    expect(movie[:id]).to eq(238)
    
    expect(movie[:original_title]).to_not eq("The Godfather")
  end
  
  it 'returns a movie with a given ID' do
    #live call test
    WebMock.allow_net_connect!
    
    id = 122
    movie = MovieService.get_movie(id)
    
    expect(movie).to be_a(Hash)
    expect(movie[:original_title]).to eq("The Lord of the Rings: The Return of the King")
    expect(movie).to have_key(:id)
    
    expect(movie[:original_title]).to_not eq("The Godfather")
    
    WebMock.disable_net_connect!
  end
  
  it 'returns the cast of a movie with a given id' do
    #live call test
    WebMock.allow_net_connect!
    
    id = 122
    cast = MovieService.get_cast(id)
    
    expect(cast).to be_a(Hash)
    expect(cast[:original_title]).to eq("The Lord of the Rings: The Return of the King")
    expect(cast).to have_key(:id)
    
    expect(movie[:original_title]).to_not eq("The Godfather")
    
    WebMock.disable_net_connect!
  end
  
end