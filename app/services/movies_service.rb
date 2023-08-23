class MoviesService 
  def connection 
    require 'pry'; binding.pry
    connection = Faraday.new("https://api.themoviedb.org/") do |faraday|
      faraday.params["api_key"] = ENV["MOVIE_API_KEY"]
    end
    
  end

  def top_rated
    response = connection.get("3/movie/top_rated")
  end

  def find_movie(id)

  end

  def reviews_for(id)

  end

  def cast_of(id)

  end
end