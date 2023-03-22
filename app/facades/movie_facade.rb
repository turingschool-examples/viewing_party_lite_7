class MovieFacade
  def initialize(movie_id)
    @movie_id = movie_id
    @service = MovieService.new
  end

  # def movies
  #   json = @service.top_rated_movies

  #   movies = json[:results].map do |movie_data|
  #     Movie.new(movie_data)
  #   end
  # end

  def cast
    cast = @service.cast(movie_id)
    cast.map { |cast_member| cast_member[:name], cast_member[:character] }
  end
end