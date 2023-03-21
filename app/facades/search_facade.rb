class MovieFacade
	def top_rated_movies
		service = MovieService.new

		json = service.top_rated
	end
end