class MovieFacade
  def initialize(title)
    @title = title
    @movie = MovieService.new
  end

  def get_discover_movies
    discover = @movie.discover_movies

    search_results = discover[:results].map do |movie_data|
      build_movie_from_api(movie_data)
    end
  end
  
  def discovery?
    @title.nil?
  end

  def get_search_movies
    json = @movie.search_movies(@title)
    search_results = json[:results].map do |movie_data|
      build_movie_from_api(movie_data)
    end

    search_results
  end

  private

  def build_movie_from_api(movie_data)
    genre_names = get_genre_names(movie_data[:genre_ids])
    movie_id = movie_data[:id]
    movie_runtime = get_movie_runtime(movie_id)
    cast = get_movie_cast(movie_id)
    authors = get_movie_review_authors(movie_id)

    attributes = {
      id: movie_data[:id],
      title: movie_data[:title],
      vote_average: movie_data[:vote_average],
      runtime: movie_runtime[:runtime],
      genre: genre_names,
      overview: movie_data[:overview],
      top_10: cast[0..9],
      total_reviews: authors.count,
      review_authors: authors
    }

    discover_movie = DiscoverMovie.new(attributes)
    # discover_movie.save

    discover_movie
  end

  def get_genre_names(genre_ids)
    genre_names = []
    genre_ids.each do |genre_id|
      genre = @movie.genre_hash[:genres].find { |genre| genre[:id] == genre_id }
      genre_names << genre[:name] if genre
    end

    genre_names
  end

  def get_movie_runtime(movie_id)
    @movie.get_runtime(movie_id)
  end

  def get_movie_cast(movie_id)
    credits = @movie.credits(movie_id)
    credits[:cast].map do |cast_member|
      cast_member[:name]
    end
  end

  def get_movie_review_authors(movie_id)
    reviews = @movie.reviews(movie_id)
    authors = reviews[:results].map do |review|
      review[:author]
    end
  end
end