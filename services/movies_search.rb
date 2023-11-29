class MoviesSearch
  # should probably refactor conn and get into helper methods
  def top_movies
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.headers[:Authorization] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
    end
    response = conn.get('movie/top_rated')
    parsed = JSON.parse(response.body, symbolize_names: true)
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
    @search_result = parsed[:results].map do |movie|
      Movie.new(movie)
    end
  end
end