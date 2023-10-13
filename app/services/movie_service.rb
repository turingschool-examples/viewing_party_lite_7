class MovieService
  
  def end_point(url)
    response = conn.get(url) do |f|
      f.params["api_key"] = Rails.application.credentials.themoviedb[:key]
    end
    a = JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org/")
  end
end