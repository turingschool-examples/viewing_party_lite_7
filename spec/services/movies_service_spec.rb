require 'rails_helper'

describe MoviesService do
  context "class methods" do
    context "#movie_by_title" do
      it "returns movie data", :vcr do
        search = MoviesService.new.movies_by_title("Up")
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie_data = search[:results].first

        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a(Integer)
        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)
        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)
        expect(movie_data).to have_key :genre_ids
        expect(movie_data[:genre_ids]).to be_a(Array)
        expect(movie_data).to have_key :overview
        expect(movie_data[:overview]).to be_a(String)
      end
    end
  end
end