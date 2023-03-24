require 'rails_helper'

RSpec.describe MoviedbFacade do
  describe "instance methods" do
    context "#initialize" do
      it "exists and can create a variable" do
        movie_facade = MoviedbFacade.new(search: "space")

        expect(movie_facade).to be_a(MoviedbFacade)
        expect(movie_facade.word).to eq("space")
      end
    end

    context "#movie_service" do
      it "returns instance of service object" do
        movie_facade = MoviedbFacade.new(search: "space")
            
        expect(movie_facade.movie_service).to be_a(MoviedbService)
      end
    end
    
    context "#get_movie_search" do
      it "returns array of movie objects" do
        search_results = File.read("spec/fixtures/moviedb/search_results.json")
        stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV["TMDB_API_KEY"]}&include_adult=false&query=space%20od")
        .to_return(status: 200, body: search_results, headers: {})
        
        film = MoviedbFacade.new(search: "space od")

        expect(film.movies_keyword_search).to be_an(Array)
        expect(film.movies_keyword_search.first).to be_a(Movie)
      end
    end

    context "#get_top_movies" do
      it "returns array of movie objects" do
        top_movies = File.read("spec/fixtures/moviedb/top_movies.json")
        stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV["TMDB_API_KEY"]}&include_adult=false")
        .to_return(status: 200, body: top_movies, headers: {})
        
        film = MoviedbFacade.new(empty_string: "")
  
        expect(film.top_20_movies).to be_an(Array)
        expect(film.top_20_movies.first).to be_a(Movie)
      end
    end

    context "#all_movie_info" do
      it "returns a movie object" do
        movie_response = File.read("spec/fixtures/moviedb/space_odyssey.json")
        stub_request(:get, "https://api.themoviedb.org/3/movie/62?api_key=#{ENV["TMDB_API_KEY"]}")
        .to_return(status: 200, body: movie_response, headers: {})
          
        cast_response = File.read("spec/fixtures/moviedb/space_cast.json")
        stub_request(:get, "https://api.themoviedb.org/3/movie/62/credits?api_key=#{ENV["TMDB_API_KEY"]}")
        .to_return(status: 200, body: cast_response, headers: {})

        reviews_response = File.read("spec/fixtures/moviedb/space_reviews.json")
        stub_request(:get, "https://api.themoviedb.org/3/movie/62/reviews?api_key=#{ENV["TMDB_API_KEY"]}")
        .to_return(status: 200, body: reviews_response, headers: {})
        film = MoviedbFacade.new(movie_id: 62)
        
        expect(film.all_movie_info).to be_a(Movie)
      end
    end

    # Write tests for Helper Methods: 
    # context "#find_movie_info" 
    # context "#find_review_info"
    # context "#find_cast_info"
    
  end
end