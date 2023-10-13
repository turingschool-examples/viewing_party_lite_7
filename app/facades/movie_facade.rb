class MovieFacade
  attr_reader :movie_id
  
  def initialize(movie)
    @movie = movie
  end
  
  def self.movie_details(movie)
    movie_data = MovieDbService.new.movie_details(movie)
    movie_data = movie_data.slice(:id, :title, :vote_average, :runtime, :genres, :description, :poster_path)
    Movie.new(movie_data)
  end

  def self.movie_cast(movie)
    cast_data = MovieDbService.new.movie_cast(movie)
    cast_data[:cast].map { |cast_member| Cast.new(cast_member) }
  end

  def self.movie_reviews(movie)
    review_data = MovieDbService.new.movie_reviews(movie)
    review_data[:results].map { |review| Review.new(review) }
  end
end