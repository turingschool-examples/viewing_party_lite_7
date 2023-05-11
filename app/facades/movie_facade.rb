# middle party between movies controller and movies service
class MovieFacade
  def initialize; end

  def find_movies(query)
    service = MovieService.new
    json = service.movies(query)[:results]

    movies = []
    json.each_with_index do |info, i|
      break if i > 19

      movies << Movie.new(info)
    end
    movies
  end

  def top_rated_movies
    service = MovieService.new
    json = service.top_movies[:results]

    movies = []
    json.each_with_index do |info, i|
      break if i > 19

      movies << Movie.new(info)
    end
    movies
  end

  def find_movie(id)
    data = MovieService.new.find_movie(id)
    Movie.new(data)
  end
end
