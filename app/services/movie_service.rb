class MovieService
  def initialize
    WebMock.allow_net_connect!
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def movie_poster(id)
    get_url("/3/movie/#{id}/images")
  end
end