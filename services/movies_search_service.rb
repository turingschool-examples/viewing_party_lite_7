class MoviesSearchService
  def conn
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.headers[:Authorization] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def top_movies
    get_url('movie/top_rated')
  end

  def search_movies(keyword)
    connection = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.headers[:Authorization] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
      faraday.params[:query] = keyword
    end
    response = connection.get('search/movie')
    parsed = JSON.parse(response.body, symbolize_names: true)
    parsed[:results].map do |movie|
      Movie.new(movie)
    end
  end

  # def search_conn(keyword)
  #   Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
  #     faraday.headers[:Authorization] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
  #     faraday.params[:query] = keyword
  #   end
  # end

  # Need to figure out how to use search_conn here (no keyword) could maybe just pass the keyword and do the url in the method
  # def get_search_url(url)
  #   response = search_conn.get(url)
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  def genre_runtime(movie_id)
    movie_data = get_url("movie/#{movie_id}")
    @movie = Movie.new(movie_data)
  end

  def movie_cast(movie_id)
    cast_data = get_url("movie/#{movie_id}/credits")
    cast_data[:cast].map do |actor|
      Movie.new(actor)
    end
  end

  def movie_reviews(movie_id)
    review_data = get_url("movie/#{movie_id}/reviews")
    review_data[:results].map do |review|
      Movie.new(review)
    end
  end

  # Refactor for sure
  # had to add this bc i couldnt figure out how to pull from outside hash and inside in one method (above)
  def movie_review_count(movie_id)
    review_count_data = get_url("movie/#{movie_id}/reviews")
    @review_count_data = Movie.new(review_count_data)
  end
end