class MovieFacade
	def popular_movies
		json = MovieService.new.top_rated
		json[:results].map do |data|
			MovieSearch.new(data)
		end
	end
  def self.search_results(movie_title)
    movies = MovieService.new.search(movie_title)
    movies[:results].map do |data|
      MovieSearch.new(data)
    end
  end

	def movie_details(movie_id)
		Movie.new(MovieService.new.details(movie_id))
	end

	def service
		MovieService.new
	end
end