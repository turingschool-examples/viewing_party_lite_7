class MovieFacade 

  def initialize(movie_id)
    @id = movie_id 
  end

  def get_movie
    movie_data = MovieService.movie_data(@id)
    Movie.new(movie_data)
  end

  def get_cast
    MovieService.cast(@id)[:cast][0..9].map do |cast_data|
      "#{cast_data[:name]} as #{cast_data[:character]}"
    end
  end

  def get_reviews
    MovieService.reviews(@id)[:results].map do |review_data|
      Review.new(review_data)
    end
  end

  # def count_reviews
  #   MovieService.reviews(@id)[:results].map do |review_data|
  #     Review.new(review_data)
  #   end.count
  # end
end
