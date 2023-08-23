class MovieService
  
  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    end
  end

  def get_url(url)
    response = conn.get(url) do |r|
      r.params['api_key'] = ENV["api_key"]
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def discover
    get_url("/3/discover/movie")
  end
end
