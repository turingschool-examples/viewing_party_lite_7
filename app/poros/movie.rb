class Movie
	attr_reader :id,
              :image,
							:title,
							:vote_average,
							:runtime,
							:genres,
							:description,
              :cast,
              :reviews

	def initialize(data)
    @id = data[:id]
		@image = data[:poster_path]
		@title = data[:title]
		@vote_average = data[:vote_average]
		@runtime = data[:runtime]
		@genres = data[:genres]
		@description = data[:overview]
	end

  def add_cast(cast)
    @cast = cast
  end

  def add_reviews(reviews)
    @reviews = reviews
  end
end