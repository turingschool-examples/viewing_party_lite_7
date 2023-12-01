require 'rails_helper'

describe MovieService do
  it "top_rated - returns movie data", :vcr do
    search = MovieService.top_rated

    expect(search).to be_a Hash
    expect(search[:results]).to be_an Array

    movie_data = search[:results].first

    expect(movie_data).to have_key :backdrop_path
    expect(movie_data[:backdrop_path]).to be_a(String)
    expect(movie_data).to have_key :genre_ids
    expect(movie_data[:genre_ids]).to be_a(Array)
    expect(movie_data).to have_key :id
    expect(movie_data[:id]).to be_a(Integer)
    expect(movie_data).to have_key :overview
    expect(movie_data[:overview]).to be_a(String)
    expect(movie_data).to have_key :popularity
    expect(movie_data[:popularity]).to be_a(Float)
    expect(movie_data).to have_key :poster_path
    expect(movie_data[:poster_path]).to be_a(String)
    expect(movie_data).to have_key :release_date
    expect(movie_data[:release_date]).to be_a(String)
    expect(movie_data).to have_key :title
    expect(movie_data[:title]).to be_a(String)
    expect(movie_data).to have_key :vote_average
    expect(movie_data[:vote_average]).to be_a(Float)
    expect(movie_data).to have_key :vote_count
    expect(movie_data[:vote_count]).to be_a(Integer)


    expect(search[:results].count).to eq(20)
  end

  it "searched_movies - returns movie data", :vcr do
    search = MovieService.searched_movies("Django")

    expect(search).to be_a Hash
    expect(search[:results]).to be_an Array

    movie_data = search[:results].first

    expect(movie_data).to have_key :backdrop_path
    expect(movie_data[:backdrop_path]).to be_a(String)
    expect(movie_data).to have_key :genre_ids
    expect(movie_data[:genre_ids]).to be_a(Array)
    expect(movie_data).to have_key :id
    expect(movie_data[:id]).to be_a(Integer)
    expect(movie_data).to have_key :overview
    expect(movie_data[:overview]).to be_a(String)
    expect(movie_data).to have_key :popularity
    expect(movie_data[:popularity]).to be_a(Float)
    expect(movie_data).to have_key :poster_path
    expect(movie_data[:poster_path]).to be_a(String)
    expect(movie_data).to have_key :release_date
    expect(movie_data[:release_date]).to be_a(String)
    expect(movie_data).to have_key :title
    expect(movie_data[:title]).to be_a(String)
    expect(movie_data).to have_key :vote_average
    expect(movie_data[:vote_average]).to be_a(Float)
    expect(movie_data).to have_key :vote_count
    expect(movie_data[:vote_count]).to be_a(Integer)


    expect(search[:results].count).to eq(20)
  end
end