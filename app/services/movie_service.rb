class MovieService
  def get_movie(movie)
    get_url("/3/movie/#{movie}")
  end

  def get_cast_members(movie)
    get_url("/3/movie/#{movie}/credits")
  end

  def get_reviews(movie)
    get_url("/3/movie/#{movie}/reviews")
  end

  def get_top_movies
    get_url('/3/movie/top_rated')
  end

  def get_searched_movies(query)
    get_url("3/search/movie?query=#{query}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.tmdb[:key]
    end
  end
end
