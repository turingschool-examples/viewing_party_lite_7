class MovieFacade
	def popular_movies
		service = MovieService.new
		json = service.popular
		json[:results].map do |data|
			
		end
	end

	# def movie_details
	# 	service = MovieService.new
	# 	json = service.
	# end
end