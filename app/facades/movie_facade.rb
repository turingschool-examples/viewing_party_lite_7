class MovieFacade
	# def popular_movies
	# 	service = MovieService.new
	# 	json = service.popular
	# 	json[:results].map do |data|
			
	# 	end
	# end
  def self.search_results(movie_title)
    movies = MovieService.new.search(movie_title)
    movies[:results].map do |data|
      MovieSearch.new(data)
    end
  end
	# def movie_details
	# 	service = MovieService.new
	# 	json = service.
	# end
end