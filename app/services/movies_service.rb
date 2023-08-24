class MoviesService 
  def connection 
    connection = Faraday.new("https://api.themoviedb.org/") do |faraday|
      faraday.params["api_key"] = ENV["MOVIE_API_KEY"]
    end
  end

  def search(keyword)

  end

  def top_rated
    response = connection.get("3/movie/top_rated")
    JSON.parse(response.body, symbolize_names: true)["results"]
  end

  def find_movie(id)
    response = connection.get("3/movie/#{id}") do |f|
      f.params["append_to_response"] = "reviews,credits"
    end
    Movie.new(JSON.parse(response.body, symbolize_names: true))
  end
end