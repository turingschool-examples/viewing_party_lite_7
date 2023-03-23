require 'rails_helper'

RSpec.describe MoviedbFacade do
  describe "class methods" do
    context ":get_movie_search" do
      it "returns array of movie objects" do
        search_results = File.read("spec/fixtures/moviedb/search_results.json")
        stub_request(:get, "https://api.themoviedb.org/search/movie?include_adult=false&query=space%20od")
        .to_return(status: 200, body: search_results, headers: {})

        expect(MoviedbFacade.new.get_movie_search("space od")).to be_an(Array)
        expect(MoviedbFacade.new.get_movie_search("space od").first).to be_a(Movie)
      end
    end

    context ":get_top_movies" do
      it "returns array of movie objects" do
        top_movies = File.read("spec/fixtures/moviedb/top_movies.json")
        stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?include_adult=false")
        .to_return(status: 200, body: top_movies, headers: {})
  
        expect(MoviedbFacade.new.get_top_movies).to be_an(Array)
        expect(MoviedbFacade.new.get_top_movies.first).to be_a(Movie)
      end
    end
  end
end