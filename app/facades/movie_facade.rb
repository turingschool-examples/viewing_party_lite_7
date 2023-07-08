class MovieFacade
  def initialize(params)
    @title = params[:title]
    @search_type = params[:type]
    @id = params[:id]
  end

  def search
    if @search_type == "top20rated"
      top_rated_movies
    else
      search_movies
    end
  end

  def top_rated_movies
    movies = MovieService.new.top_rated_movies

    movies[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def search_movies
    if @title.nil?
      search_movies_by_id
    else
      movies = MovieService.new.search_movies(@title)
      movies[:results].map { |movie| Movie.new(movie) }
    end
  end

  def search_movies_by_id
    movie = MovieService.new.search_movies_by_id(@id)
    cast = MovieService.new.find_cast(@id)
    reviews = MovieService.new.find_reviews(@id)
    @movie = Movie.new(movie, cast, reviews)
  end
end