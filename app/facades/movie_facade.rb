class MovieFacade
  attr_reader :movie_id,
              :user_id

  def initialize(params)
    @movie_id = params[:id]
    @user_id = params[:user_id]
    @commit = params[:commit]
    @title = params[:search]
  end

  def user
    @_user ||= User.find(@user_id)
  end

  def movies
    if @commit == "Find Movies"
      movie_search(@title)
    else
      top_rated_movies
    end
  end

  def top_rated_movies
    MovieService.top_rated_movies[:results][0..19].map do |movie|
      Movie.new(movie)
    end
  end

  def movie_search(search)
    MovieService.movie_search(search)[:results][0..19].map do |movie|
      Movie.new(movie)
    end
  end

  def movie_details
    Movie.new(find_by_id(@movie_id))
  end

  def movie_title
    movie_details.title
  end

  def movie_rating
    movie_details.rating
  end

  def movie_runtime
    total_minutes = movie_details.runtime

    hours = total_minutes / 60
    minutes = total_minutes % 60
    "#{hours}hr #{minutes}min"
  end

  def movie_genre
    movie_details.genres.map { |genre| genre[:name] }.join(", ")
  end

  def movie_summary
    movie_details.summary
  end

  def first_ten_cast
    cast_collector = {}

    MovieService.cast_by_id(@movie_id)[:cast][0..9].each do |cast|
      cast_collector[cast[:name]] = cast[:character]
    end

    cast_collector
  end

  def movie_cast
    first_ten_cast.map do |name, character|
      "#{name} as #{character}"
    end
  end

  def all_reviews
    review_collector = {}

    MovieService.reviews_by_id(@movie_id)[:results].map do |review|
      review_collector[review[:author]] = review[:content]
    end

    review_collector
  end

  def movie_reviews
    all_reviews.map do |author, content|
      "#{content} - #{author}"
    end
  end

  def number_of_reviews
    all_reviews.count
  end

  def find_by_id(movie_id)
    MovieService.find_by_id(movie_id)
  end
end
