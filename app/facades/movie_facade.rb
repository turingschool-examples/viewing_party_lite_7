class MovieFacade
  def initialize(movie)
    @movie = movie
  end

  def top_twenty
    top_twenties_data[:results].map do |top_twenty_data|
      Movie.new(top_twenty_data)
    end
  end

  def search
    search_data[:results].map do |searched|
      Movie.new(searched)
    end
  end

  def search_data
    @search_data = movie_service.movie_search
  end

  private

  def top_twenties_data
    @_top_twenties_data ||= movie_service.top_20_flicks
  end
end
  