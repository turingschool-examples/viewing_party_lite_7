class MovieService
  
  def conn
    Faraday.new(url: "https://api.themoviedb.org/") do |f|
      f.params["api_key"] = Rails.application.credentials.themoviedb[:key]
    end
  end

  def end_point(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
end