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
end
