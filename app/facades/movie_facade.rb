class MovieFacade
  def top_rated
    results = service.top_rated[:results]
    results.map do |result|
      Movie.new(result)
    end
  end

  def search(keyword)
    results = service.search(keyword)[:results]
    results.map do |result|
      Movie.new(result)
    end
  end

  def service
    MovieService.new
  end
end