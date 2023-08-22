class MoviesService
  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["movie_api_key"]
    end

    response = conn.get("/3/discover/movie") 
  end
end

# , { api_key: ENV["movie_api_key"] }

# do |req|
#       req.params["api_key"] = ENV["movie_api_key"]
#     end