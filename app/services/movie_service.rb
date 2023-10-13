class MovieService
  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def movie_images(id)
    get_url("/3/movie/#{id}/images")
  end
  
  def movie_details(id)
    get_url("3/movie/#{id}")
  end
end