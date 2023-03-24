class MovieService
	def search(movie_title)
		get_url("3/search/movie?query=#{movie_title}")
	end

	def details(movie_id)
		get_url("3/movie/#{movie_id}")
	end

	def top_rated
		get_url("3/movie/popular")
	end

  def credits(movie_id)
    get_url("3/movie/#{movie_id}/credits")
  end  

  def reviews(movie_id)
    get_url("3/movie/#{movie_id}/reviews")
  end
  
	def get_url(url)
		response = conn.get(url)
		JSON.parse(response.body, symbolize_names: true)
	end

	def conn
		Faraday.new(url: "https://api.themoviedb.org/") do |faraday|
			faraday.params["api_key"] = ENV["MOVIEDB_API_KEY"]
		end
	end
end