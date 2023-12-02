class ServiceService
  def conn
    Faraday.new("https://api.themoviedb.org/3/") do |faraday|
      faraday.params["api_key"] = ENV["API_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: :true)
  end
end