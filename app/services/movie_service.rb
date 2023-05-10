class MovieService
  
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn 
    Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
      faraday.headers["api_key"] = ENV[""]
    end
  end
end