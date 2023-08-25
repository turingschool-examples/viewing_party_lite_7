require 'rails_helper'

RSpec.describe MoviesService, :vcr do
  it 'can retrieve top 20 movies' do
    movies = MoviesService.new.top_rated
    expect(movies).to be_an(Array)
    expect(movies.count).to eq(20)
  end

  it 'can search for movies by keyword in title', :vcr do
    service = MoviesService.new
    keyword = 'Inception'
    movies = service.search(keyword)

    expect(movies).to be_an(Array)
    expect(movies.first).to have_key(:title)
    
    titles = movies.map { |movie| movie[:title].downcase }
    expect(titles.any? { |title| title.include?(keyword.downcase) }).to be(true)
  end

  it 'can generate a poro for a specific movie' do
    movie = MoviesService.new.find_movie(234)
    expect(movie).to be_a(Movie)
    expect(movie.title).to be_a(String)
    expect(movie.id).to be_an(Integer)
    expect(movie.image).to be_a(String)
    expect(movie.rating).to be_a(Float)
    expect(movie.runtime).to be_an(Integer)
    expect(movie.genres).to be_a(String)
    expect(movie.summary).to be_a(String)
    expect(movie.cast).to all be_a(CastMember)
    expect(movie.total_reviews).to be_an(Integer)
    expect(movie.reviews).to all be_a(Review)
  end
end
