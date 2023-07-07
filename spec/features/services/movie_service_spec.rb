require "rails_helper"

RSpec.describe MovieService do
  describe "instance methods" do
    context "#get top movies" do
      it "returns top movies data", :vcr do
        search = MovieService.new.find_top_movies

        expect(search).to be_a(Hash)
        expect(search[:results]).to be_an(Array)

        movie_data = search[:results].first

        expect(movie_data).to have_key(:id)
        expect(movie_data[:id]).to be_an(Integer)

        expect(movie_data).to have_key(:title)
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key(:vote_average)
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end

    context "#search movies by keyword" do
      it "returns movie data based on keyword", :vcr do
        search = MovieService.new.search_movies_by_keyword("Princess")

        expect(search).to be_a(Hash)
        expect(search[:results]).to be_an(Array)

        movie_data = search[:results].first

        expect(movie_data).to have_key(:id)
        expect(movie_data[:id]).to be_an(Integer)

        expect(movie_data).to have_key(:title)
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key(:vote_average)
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end
  end
end
