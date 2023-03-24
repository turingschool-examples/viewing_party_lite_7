class MovieFacade
  def initialize(movie_id)
    @movie_id = movie_id
    @service = MovieService.new
  end

  def movie
    movie_info = @service.movie_by_id(@movie_id)
    
    Movie.new(movie_info)
  end

  # def search(query)
  #   @service.movie_search(query)
  # end

  def cast
    cast_info = @service.movie_cast(@movie_id)
    cast_info[:cast].take(10)
    # cast.map { |cast_member| { name: cast_member[:name], character: cast_member[:character] } }
  end
end

# def top_rated
#   top_rated = @service.top_rated_movies

#   movies = top_rated[:results].map do |movie_data|
#     Movie.new(movie_data)
#   end
# end
