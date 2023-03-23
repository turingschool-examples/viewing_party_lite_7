class Movie
	attr_reader

	def intialize(data)
		@image = data[:poster_path]
		@title = data[:title]
		@vote_average = data[:vote_average]
		# @runtime = data[:runtime]
		# @genre = data[:genre]
		@description = data[:summary]
		@cast = data[:cast]
		@review_count = data[:review_count]
		@review_author = data[:review_author] # and information
	end
end