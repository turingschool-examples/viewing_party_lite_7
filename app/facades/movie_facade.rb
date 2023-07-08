class MovieFacade
  attr_reader :keyword

  def initialize(keyword = nil)
    @keyword = keyword
  end

  def find_movies
    service = MovieService.new

    json = @keyword.nil? ? service.find_top_movies : service.search_movies_by_keyword(@keyword)

    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def show_movie_details
    service = MovieService.new
    movie_data = service.movie_details(@keyword)
    @movie = Movie.new(movie_data)
  end

  # def top_ten_cast(movie_id)
  #   binding.pry
  #   service = MovieService.new
  #   cast_data = service.movie_cast(movie_id)

  #   @cast = Credit.new(___)
  # end
end
