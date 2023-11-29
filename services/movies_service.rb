class MoviesService
  # should probably refactor conn and get into helper methods
  def top_movies
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.headers[:Authorization] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
    end
    response = conn.get('movie/top_rated')
    top_rated = JSON.parse(response.body, symbolize_names: true)
  end

  # need to add param for keyword
  def search_movies(keyword)
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.headers[:Authorization] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
      faraday.params[:query] = keyword
    end
    response = conn.get('search/movie')
    search_result = JSON.parse(response.body, symbolize_names: true)
  end
end