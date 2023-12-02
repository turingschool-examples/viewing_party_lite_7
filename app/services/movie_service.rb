class MovieService

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.tmdb[:key]
    end
  end

  def movie_details(id)
    get_url("/3/movie/#{id}")
  end

  def get_credits(id)
    get_url("/3/movie/#{id}/credits")
  end

  def get_reviews(id)
    get_url("/3/movie/#{id}/reviews")
  end

  def movie_images(id)
    get_url("/3/movie/#{id}/images")
  end
end
