class MovieService
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def top_movies
    get_url('/3/movie/popular')
  end

  def search_movies(title)
    get_url("/3/search/movie?query=#{title}")
  end

  def movie_details(id)
    get_url("/3/movie/#{id}")
  end

  def movie_cast(id)
    get_url("/3/movie/#{id}/credits")
  end

  def movie_reviews(id)
    get_url("/3/movie/#{id}/reviews")
  end

  def conn
    # require 'pry';binding.pry
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.tmdb[:key]
    end
  end
end