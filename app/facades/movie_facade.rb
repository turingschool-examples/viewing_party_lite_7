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
end
