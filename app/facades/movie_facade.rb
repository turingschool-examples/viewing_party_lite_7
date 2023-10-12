class MovieFacade
  attr_reader :movie_id
  
  def initialize(movie_id)
    @movie_id = movie_id
  end
  
  def movie_details(movie_id)
    movie_data = MovieDbService.new.movie_details(movie_id)
    movie_data.map { |movie| Movie.new(movie) }
  end

  def movie_cast(movie_id)
    cast_data = MovieDbService.new.movie_cast(movie_id)
    cast_data.map { |cast_member| Cast.new(cast_member) }
  end

  def movie_reviews(movie_id)
    review_data = MovieDbService.new.movie_reviews(movie_id)
    review_data[:results].map { |review| Review.new(review) }
  end
end