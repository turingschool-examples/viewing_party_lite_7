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
    conn = Faraday.new(url: "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.tmdb[:key]
    end
    
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)
    movies = Hash.new
    data[:results].each do |movie|
      movies[movie[:title]] = [movie[:vote_average].round(1), movie[:id]]
    end
    movies
  end

  def self.search(search_params)
    conn = Faraday.new(url: "https://api.themoviedb.org/3/search/movie?query=#{search_params}&include_adult=false&language=en-US&page=1") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.tmdb[:key]
    end
    
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)
    movies = Hash.new
    data[:results].each do |movie|
      movies[movie[:title]] = [movie[:vote_average].round(1), movie[:id]]
    end
    movies
  end
end