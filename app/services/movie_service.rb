class MovieService
  def self.get_movies
    conn = Faraday.new("https://api.themoviedb.org/3/")

    response = conn.get("movie/popular") do |faraday|
      faraday.params["api_key"] = "67af88004fc9a5fe47497bb47e0dc073"
    end

    movie_data = JSON.parse(response.body, symbolize_names: :true)  
    movie_data = movie_data[:results].map do |movie_hash|
      Movie.new(movie_hash)
    end
  end

  def self.search_movies(search_params)
    conn = Faraday.new("https://api.themoviedb.org/3/")

    response = conn.get("search/movie") do |faraday|
      faraday.params["api_key"] = "67af88004fc9a5fe47497bb47e0dc073"
      faraday.params["query"] = search_params
    end

    movie_data = JSON.parse(response.body, symbolize_names: :true)   
    movie_data = movie_data[:results].map do |movie_hash|
      Movie.new(movie_hash)
    end
  end

  def self.get_detailed_movie(id)
    conn = Faraday.new("https://api.themoviedb.org/3/")

    response = conn.get("movie/#{id}") do |faraday|
      faraday.params["api_key"] = "67af88004fc9a5fe47497bb47e0dc073"
    end

    movie_data = JSON.parse(response.body, symbolize_names: :true)   
    DetailedMovie.new(movie_data)
  end
end