class MovieService
  def top_rated_20
    get_url("/3/movie/top_rated?page=1")
  end

  def search(movie)
    get_url("/3/search/movie?query=#{movie}&include_adult=false&language=en-US&page=1")
  end

  def get_movie(movie_id)
    # require 'pry';binding.pry
    get_url("/3/movie/#{movie_id}")
  end

  def get_cast_member(movie_id)
    get_url("/3/movie/#{movie_id}/credits")
  end

  def get_reviews(movie_id)
    get_url("/3/movie/#{movie_id}/reviews")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end
  end
end
