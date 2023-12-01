class MovieFacade
  attr_reader :movie
  def initialize(tmdb_id)
    @tmdb_id = tmdb_id
    @movie = movie_maker
  end

  def movie_maker
    service = MovieService.new
    
    json = service.all_details(@tmdb_id)
    
    MovieData.new(json)
  end

  def self.top_movies
    data = MovieService.top_movies
    data[:results].reduce(Hash.new) do |movies_hash, movie|
      movies_hash[movie[:title]] = [movie[:vote_average].round(1), movie[:id]] ; movies_hash
    end
  end

  def self.search(search_params)
    data = MovieService.search(search_params)
    data[:results].reduce(Hash.new) do |movies_hash, movie|
      movies_hash[movie[:title]] = [movie[:vote_average].round(1), movie[:id]] ; movies_hash
    end
  end
end