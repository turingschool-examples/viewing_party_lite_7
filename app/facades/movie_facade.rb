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

  private

  def service
    @service ||= MovieService.new
  end
end
