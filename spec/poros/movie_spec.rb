require 'rails_helper'

RSpec.describe Movie do
  before(:each) do
    @data = MovieService.new.search_movies_by_id(603)
    @cast = MovieService.new.find_cast(221)
    @reviews = MovieService.new.find_reviews(221)
    @movie = Movie.new(@data, @cast, @reviews)
  end

  it 'exists' do
    expect(@movie).to be_a(Movie)
  end

  it 'has attributes' do
    expect(@movie.id).to eq(603)
    expect(@movie.title).to eq('The Matrix')
    expect(@movie.vote_average).to eq(8.2)
    expect(@movie.vote_count).to eq(23409)
    expect(@movie.runtime).to eq(136)
    expect(@movie.summary).to eq('Set in the 22nd century, The Matrix tells the story of a computer hacker who joins a group of underground insurgents fighting the vast and powerful computers who now rule the earth.')
    expect(@movie.poster_path).to eq('/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg')
    expect(@movie.genres).to eq(['Action', 'Science Fiction'])
    expect(@movie.cast).to be_an(Array)
    expect(@movie.cast.count).to eq(10)
    expect(@movie.num_reviews).to eq(0)
    expect(@movie.reviews).to be_an(Array)
  end

  it 'can convert the genre info nested hash to an array of genre names' do
    expect(@data[:genres]).to be_an(Array)
    expect(@data[:genres]).to eq([{:id=>28, :name=>"Action"}, {:id=>878, :name=>"Science Fiction"}])
    expect(@movie.genre_names(@data[:genres])).to eq(['Action', 'Science Fiction'])
    expect(@movie.genres).to eq(['Action', 'Science Fiction'])
  end

  it 'can convert the runtime from minutes (int) to X hours and Y minutes (string)' do
    expect(@data[:runtime]).to eq(136)
    expect(@movie.runtime).to eq(136)
    expect(@movie.convert_runtime).to eq('2h 16m')
  end

  it 'can convert the cast info nested hash to an array of cast names' do
    expect(@cast).to be_a(Hash)
    expect(@cast[:cast]).to be_an(Array)
    expect(@movie.convert_cast(@cast[:cast][0..9])).to eq(["James Dean", "Natalie Wood", "Sal Mineo", "Jim Backus", "Ann Doran", "Corey Allen", "William Hopper", "Rochelle Hudson", "Dennis Hopper", "Edward Platt"])
  end
end
