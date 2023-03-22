require 'rails_helper'

RSpec.describe MovieService  do
  context "class methods" do
    context "#top_movies" do
      it "returns movie data" do
        get = MovieService.top_movies
        expect(get).to be_a(Hash)
        expect(get[:results]).to be_an(Array)
        movie_data = get[:results].first

        expect(movie_data).to have_key(:title)
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key(:vote_average)
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end
  end
end