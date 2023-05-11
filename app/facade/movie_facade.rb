class MovieFacade 

  def self.top_rated_movies
    MovieService.top_rated_movies[:results][0..19].map do |movie|
      Movie.new(movie)
    end
  end

  def self.movie_search(search)
    MovieService.movie_search(search)[:results][0..19].map do |movie|
      Movie.new(movie)
    end
  end

  def self.find_by_id(id)
    MovieService.find_by_id(id)
  end

  def self.movie_details(id)
    Movie.new(find_by_id(id))
  end

  def self.reviews(id)
    reviews = MovieService.reviews(id)[:results]
    reviews.map do |review|
      Review.new(review)
    end[0..9]
  end

  def self.cast(id)
    cast = MovieService.cast(id)[:cast]
    cast.map do |actor|
      Cast.new(actor)
    end[0..9]
  end
end