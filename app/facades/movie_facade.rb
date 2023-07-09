class MovieFacade
  def initialize(id)
    @id = id
  end

  def get_movie_details
    
    service = MovieService.new

    results = service.find_movie(@id)
    new_movie = Movie.new(results)
  end

  def get_cast
    service = MovieService.new

    results = service.find_cast(@id)[:cast]
    
    cast_results = results.map do |cast_details|
      Cast.new(cast_details)
    end
  end

  def get_reviews
    service = MovieService.new

    results = service.find_reviews(@id)[:results]

    review_results = results.map do |review_details|
      Reviews.new(review_details)
    end
  end
end