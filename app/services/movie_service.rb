class MovieService
  def discover_results
    result = json_from_url('/3/discover/movie?q=top%20rated&page=1')
  end

  def search_results(query)
    result = json_from_url("/3/search/movie?query=#{query}&page=1")
    require 'pry'; binding.pry
    result
  end

  def json_from_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['authorization'] =
        Rails.application.credentials.tmdb[:access_token]
    end
  end
end
