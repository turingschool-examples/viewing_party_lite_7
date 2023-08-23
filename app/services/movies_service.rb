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
    JSON.parse(response.body)["results"]
  end

  def find_movie(id)
    response = connection.get("3/movie/#{id}") do |f|
      f.params["append_to_response"] = "reviews,credits"
      # makes all three calls at once
      # Includes the details, reviews, and credits in one response
    end
    Movie.new(JSON.parse(response.body))
  end
end