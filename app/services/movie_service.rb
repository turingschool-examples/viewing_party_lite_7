class MovieService
  
  def end_point(url)
    response = conn.get(url) do |f|
      f.params["api_key"] = "e385578ab01fe734e045aab1091acf8c"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org/")
  end
end