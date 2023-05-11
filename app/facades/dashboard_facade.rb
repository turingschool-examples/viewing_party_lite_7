class DashboardFacade
  def self.search_movies(query)
    data = MovieDbService.search_movies(query)
    data[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.movie_details(id)
    data = MovieDbService.movie_details(id)
    Movie.new(data)
  end

  def self.top_movies
    data = MovieDbService.top_movies
    data.map do |movie_data|
      Movie.new(movie_data)
    end
  end
  
end
