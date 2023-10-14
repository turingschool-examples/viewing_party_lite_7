class MoviesService

  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.tmdb[:key]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def movies_by_title(search)
    get_url("/3/search/movie?query=#{search}")
  end

  def top_rated
    get_url("/3/movie/top_rated")
  end

  def details(id)
    get_url("/3/movie/#{id}")
  end

  def credits(id)
    get_url("/3/movie/#{id}/credits")
  end

  def reviews(id)
    get_url("/3/movie/#{id}/reviews")
  end

  def poster_path(id)
    get_url("/3/movie/#{id}/poster_path")
  end
end