require 'rails_helper'

RSpec.describe MoviesFacade, :vcr do
  it 'has no movies by default' do
    facade = MoviesFacade.new
    expect(facade._cached_movies).to be_empty
  end

  it 'can collect and save movies' do
    facade = MoviesFacade.new
    movie1 = facade.find_movie(234)
    expect(facade._cached_movies).to eq({ 234 => movie1 })
    movie1_renamed = facade.find_movie(234)
    movie2 = facade.find_movie(550)
    movie2_renamed = facade.find_movie(550)
    expect(movie1).to eq(movie1_renamed)
    expect(movie2).to eq(movie2_renamed)
    expect(facade._cached_movies).to eq({ 234 => movie1, 550 => movie2 })
  end
end
