class MovieListFacade

  def initialize(key_word)
    @key_word = key_word
  end

  def get_movies
    if @key_word == 'top rated'
      top_rated
    else
      search
    end
  end
  
  def search
    results = service.search(@key_word)[:results]
  
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

  private

  def service
    @service ||= MovieService.new
  end
end