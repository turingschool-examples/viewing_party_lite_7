require "rails_helper"

RSpec.describe "MoviePoros" do
  before(:each) do

  end

  it "exists" do
    attrs = {
      backdrop_path: "/path/to/backdrop",
      genre_ids: [1, 3, 80], 
      id: 123, 
      overview: "This is a test" ,
      popularity: 8.91,
      poster_path: "/path/to/poster", 
      release_date: "1997-01-20", 
      title: "Me",
      vote_average: 9.801 , 
      vote_count: 1
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie).to respond_to(:backdrop_path)
    expect(movie.backdrop_path).to be_a(String)
    expect(movie.backdrop_path).to eq("/path/to/backdrop")

    expect(movie).to respond_to(:genres)
  
    expect(attrs[:genres]).to eq(movie.genres)

    expect(movie).to respond_to(:id)
    expect(movie.id).to be_a(Integer)
    expect(movie.id).to eq(123)

    expect(movie).to respond_to(:overview)
    expect(movie.overview).to be_a(String)
    expect(movie.overview).to eq("This is a test")

    expect(movie).to respond_to(:popularity)
    expect(movie.popularity).to be_a(Float)
    expect(movie.popularity).to eq(8.91)

    expect(movie).to respond_to(:poster_path)
    expect(movie.poster_path).to be_a(String)
    expect(movie.poster_path).to eq("/path/to/poster")

    expect(movie).to respond_to(:release_date)
    expect(movie.release_date).to be_a(String)
    expect(movie.release_date).to eq("1997-01-20")

    expect(movie).to respond_to(:title)
    expect(movie.title).to be_a(String)
    expect(movie.title).to eq("Me")

    expect(movie).to respond_to(:vote_average)
    expect(movie.vote_average).to be_a(Float)
    expect(movie.vote_average).to eq(9.801)

    expect(movie).to respond_to(:vote_count)
    expect(movie.vote_count).to be_a(Integer)
    expect(movie.vote_count).to eq(1)
  end

  it "can create an object" do
    
  end
end