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

  # def get_url(url)
  #   response = conn.get(url)
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  # def search_movies
  #   get_url(("3/search/movie?query=#{params[:search]}&include_adult=false&language=en-US&page=1"))
  # end

  # def top_movies
  #   get_url("3/movie/top_rated?language=en-US&page=1")
  # end

  # def cast
  #   get_url("3/movie/#{params[:id]}/credits?language=en-US")
  # end

  # def reviews
  #   get_url("3/movie/#{params[:id]}/reviews?language=en-US")
  # end
  
end