class MovieFacade
  def initialize(movie_id)
    @id = movie_id
  end

  def find_movie
    result = service.find_movie(@id)
    MovieDetailed.new(result)
  end

  def cast
    results = service.credits(@id)[:cast]

    results[0..9].map do |result|
      Cast.new(result)
    end
  end

  def reviews
    results = service.reviews(@id)[:results]

    results.map do |result|
      Review.new(result)
    end
  end

  def review_count
    service.reviews(@id)[:total_results]
  end

  def movie_title
    find_movie.title
  end

  def movie_vote_average
    find_movie.vote_average
  end

  def movie_runtime
    find_movie.runtime
  end

  def movie_genres
    find_movie.genre.join(', ')
  end

  def movie_summary
    find_movie.summary
  end

  private

  def service
    @service ||= MovieService.new
  end
end
