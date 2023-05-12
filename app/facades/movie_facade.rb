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

  def cast_members(movie_id)
    data = MovieService.new.credits(movie_id)
    cast = []
    data[:cast].each_with_index do |member, i|
      break if i > 9

      cast << CastMember.new(member)
    end
    cast
  end

  def all_reviews(movie_id)
    data = MovieService.new.reviews(movie_id)
    data[:results].map do |results|
      Review.new(results)
    end
  end

  def review_count(movie_id)
    all_reviews(movie_id).count
  end

  def movie_title(movie_id)
    find_movie(movie_id).title
  end

  def movie_poster(movie_id)
    "https://image.tmdb.org/t/p/original#{poster_path(movie_id)}"
  end

  def poster_path(movie_id)
    data = MovieService.new.find_movie(movie_id)
    data[:poster_path]
  end
end
