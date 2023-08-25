class MovieService
  
  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV["api_key"]
    end
  end

  def image
    Faraday.new(url: "https://image.tmdb.org" ) do |faraday|
      faraday.params['api_key'] = ENV["api_key"]
    end
  end

  def get_url(url)
    response = conn.get(url) do |r|
    end
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def get_image(url)
    response = image.get("/t/p/w92/#{url}") do |r|
    end
    response.env.url
  end

  def top_rated
    get_url("/3/movie/top_rated")
  end

  def movie_query(keyword)
    get_url("/3/search/movie?query=#{keyword}")
  end

  def movie_details(movie_id)
    get_url("/3/movie/#{movie_id}")
  end

  def cast_members(movie_id)
    get_url("/3/movie/#{movie_id}/credits")
  end

  def reviews(movie_id)
    get_url("/3/movie/#{movie_id}/reviews")
  end

  def movie_image(movie_id)
    movie = movie_details(movie_id)
    get_image(movie[:poster_path])
  end
end
