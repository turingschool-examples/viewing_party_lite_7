class TmdbService
  def initialize
    @connection = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params["api_key"] = ENV["TMDb_API_KEY"]
    end
  end

  def top_rated_movies
    response = @connection.get('/3/movie/top_rated?language=en-US&page=1')
    if response.success?
      movie_data = JSON.parse(response.body)['results'][0..19]
      movies = []

      movie_data.each do |data|
        movies << Movie.new(
          title: data['title'],
          id: data['id'],
          vote_average: data['vote_average']
        )
      end
      return movies
    else
      return []
    end
  end

  def search_movies(query)
    response = @connection.get('/3/search/movie', { query: query, language: 'en-US', page: 1 })
    
    if response.success?
      movie_data = JSON.parse(response.body)['results'][0..19]
      movies = []
      movie_data.each do |data|
        movies << Movie.new(
          title: data['title'],
          id: data['id'],
          vote_average: data['vote_average']
        )
      end
      return movies
    else
      return []
    end
  end
end
