class MovieService
  def self.get_movies
    conn = Faraday.new("https://api.themoviedb.org/3/")

    response = conn.get("movie/popular") do |faraday|
      faraday.params["api_key"] = ENV["API_KEY"]
    end

    movie_data = JSON.parse(response.body, symbolize_names: :true)
    
    movie_data = movie_data[:results].map do |movie_hash|
      Movie.new(movie_hash)
    end
  end

  def self.search_movies(search_params)
    conn = Faraday.new("https://api.themoviedb.org/3/")

    response = conn.get("search/movie") do |faraday|
      faraday.params["api_key"] = ENV["API_KEY"]
      faraday.params["query"] = search_params
    end

    movie_data = JSON.parse(response.body, symbolize_names: :true)
    
    movie_data = movie_data[:results].map do |movie_hash|
      Movie.new(movie_hash)
    end
  end
end