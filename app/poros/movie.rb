class Movie
	attr_reader :image,
							:title,
							:vote_average,
							:runtime,
							:genres,
							:description
							# :cast,
							# :review_count,
							# :review_author

	def initialize(data)
		@image = data[:poster_path]
		@title = data[:title]
		@vote_average = data[:vote_average]
		@runtime = data[:runtime]
		@genres = data[:genres]
		@description = data[:overview]
		# @cast = data[:cast] # no cast yet
		# @review_count = data[:review_count]
		# @review_author = data[:review_author] # and information
	end
end