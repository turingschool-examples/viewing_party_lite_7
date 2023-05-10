require 'faraday'

class MovieService
  def conn
    Faraday.new(url: "https://api.themoviedb.org")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_top_rated_movies
    get_url("/3/movie/top_rated?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&page=1")
  end

  def get_movie_search(query)
    get_url("/3/search/movie?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&query=#{query}&page=1&include_adult=false")
  end

  def get_specific_movie(id)
    get_url("/3/movie/#{id}?api_key=#{ENV['TMDB_API_KEY']}&language=en-US")
  end
  
  def get_movie_cast_info(id)
    get_url("3/movie/#{id}/credits?api_key=#{ENV['TMDB_API_KEY']}&language=en-US")
  end

  def get_movie_review_info(id)
    get_url("3/movie/#{id}/reviews?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&page=1")
  end

end
