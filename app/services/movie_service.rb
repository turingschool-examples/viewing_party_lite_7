class MovieService
  def self.get_movies
    conn = Faraday.new("https://api.themoviedb.org/3/")

    response = conn.get("movie/popular") do |faraday|
      faraday.params["api_key"] = # I couldn't get it to accept the credentials and don't want to send up my API key
    end

    movie_data = JSON.parse(response.body, symbolize_names: :true)
    
    movie_data = movie_data[:results].map do |movie_hash|
      Movie.new(movie_hash)
    end
  end
end