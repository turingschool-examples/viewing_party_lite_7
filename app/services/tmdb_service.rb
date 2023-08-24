class TmdbService
  def initialize
    @connection = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['TMDb_API_KEY']
    end
  end

  def top_rated_movies
    response = @connection.get('/3/movie/top_rated?language=en-US&page=1')
    return [] unless response.success?

    movie_data = JSON.parse(response.body)['results']
    MovieMapper.top_results(movie_data)
  end

  def search_movies(query)
    response = @connection.get('/3/search/movie', { query: query, language: 'en-US', page: 1 })
    return [] unless response.success?

    movie_data = JSON.parse(response.body)['results']
    MovieMapper.top_results(movie_data)
  end

  def movie_details(id)
    response = @connection.get("/3/movie/#{id}")
    return [] unless response.success?

    movie_data = JSON.parse(response.body)
    MovieMapper.map_movie_details(movie_data)
  end
end
