class MovieFacade
  def initialize(id)
    @id = id
  end


  private

  def movie
    Movie.new(movie_attributes)
  end

  def movie_attributes
    @_movie ||= service.movie_details(@id)

    data = {
      id: @_movie[:id],
      title: @_movie[:title],
      vote_average: @_movie[:vote_average],
      runtime: @_movie[:runtime],
      genres: @_movie[:genres],
      overview: @_movie[:overview],
      poster_path: @_movie[:poster_path]
    }
  end

  def service
    @_service ||= MovieService.new
  end
end