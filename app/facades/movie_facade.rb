class MovieFacade
  def search(key_word)
    results = service.search(key_word)[:results]

    results.map do |result|
      Movie.new(result)
    end
  end

  def top_rated
    results = service.top_rated[:results]

    results.map do |result|
      Movie.new(result)
    end
  end

  def service
    MovieService.new
  end
end