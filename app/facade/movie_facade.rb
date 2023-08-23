class MovieFacade
  def initialize(title)
    @title = title
  end

  def get_discover_movies
    movie = MovieService.new

    discover = movie.discover_movies
    genre = movie.genre_hash
    top_rated = movie.top_rated

    search_results = discover[:results].map do |movie_data|

      genre_ids = movie_data[:genre_ids]
      genre_names = get_genre_names(genre_ids, movie.genre_hash)
      movie_id = movie_data[:id]
      movie_runtime = movie.get_runtime(movie_id)

      credits = movie.credits(movie_id)
      cast = credits[:cast].map do |cast_member|
        cast_member[:name]
      end
      
      reviews = movie.reviews(movie_id)
      authors = reviews[:results].map do |review|
        review[:author]
      end
      attributes = {
        id: movie_data[:id].to_i,
        title: movie_data[:title],
        vote_average: movie_data[:vote_average],
        runtime: movie_runtime[:runtime],
        genre: genre_names,
        overview: movie_data[:overview],
        top_10: cast[0..9],
        total_reviews: reviews.count,
        review_authors: authors
      }

      DiscoverMovie.new(attributes)
    end
  end

  def get_genre_names(genre_ids, genre_hash)
    genre_names = []
    genre_ids.each do |genre_id|
      genre = genre_hash[:genres].find { |genre| genre[:id] == genre_id }
      genre_names << genre[:name] if genre
    end

    genre_names
  end

  def get_search_movies
    movie = MovieService.new

    json = movie.search_movies(@title)
    search_results = json[:results].map do |movie|
      DiscoverMovie.new(movie)
    end
  end

  def discovery?
    @title.nil?
  end
end