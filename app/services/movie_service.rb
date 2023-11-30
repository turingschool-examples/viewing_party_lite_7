class MovieService
  def discover
    json_from_url('/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc')
  end

  def json_from_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
  end

  def conn
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['authorization'] =
        Rails.application.credentials.tmdb[:access_token]
    end
  end
end
