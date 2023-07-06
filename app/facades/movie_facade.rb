class MovieFacade
  def initialize(params)
    @title = params[:title]
    @search_type = params[:type]
  end

  def search
    if @search_type == "top_rated"
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
    movies = MovieService.new.search_movies(@title)

    movies[:results].map do |movie|
      Movie.new(movie)
    end
  end
end