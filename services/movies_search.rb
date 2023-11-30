class MoviesSearch
  def top_movies
    parsed = get_url('movie/top_rated')
    parsed[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def search_movies(keyword)
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.headers[:Authorization] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
      faraday.params[:query] = keyword
    end
    response = conn.get('search/movie')
    parsed = JSON.parse(response.body, symbolize_names: true)
    parsed[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def genre_runtime(movie_id)
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.headers[:Authorization] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
    end
    response = conn.get("movie/#{movie_id}")
    movie_data = JSON.parse(response.body, symbolize_names: true)
    @movie_data = Movie.new(movie_data)
    
  end

  def movie_cast(movie_id)
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.headers[:Authorization] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
    end
    response = conn.get("movie/#{movie_id}/credits")
    cast_data = JSON.parse(response.body, symbolize_names: true)
    cast_data[:cast].map do |actor|
      Movie.new(actor)
    end
  end

  def movie_reviews(movie_id)
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.headers[:Authorization] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
    end
    response = conn.get("movie/#{movie_id}/reviews")
    review_data = JSON.parse(response.body, symbolize_names: true)
    review_data[:results].map do |review|
      Movie.new(review)
    end
  end

  # Refactor for sure
  # had to add this bc i couldnt figure out how to pull from outside hash and inside in one method (above)
  def movie_review_count(movie_id)
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.headers[:Authorization] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
    end
    response = conn.get("movie/#{movie_id}/reviews")
    review_count_data = JSON.parse(response.body, symbolize_names: true)
    @review_count_data = Movie.new(review_count_data)
  end

  def conn
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.headers[:Authorization] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
    end
  end

  # def search_conn(keyword)
  #   Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
  #     faraday.headers[:Authorization] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
  #     faraday.params[:query] = keyword
  #   end
  # end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  # Need to figure out how to use search_conn here (no keyword)
  # def get_search_url(url)
  #   response = search_conn.get(url)
  #   JSON.parse(response.body, symbolize_names: true)
  # end
end