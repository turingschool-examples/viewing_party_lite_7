class MovieService
  def top_rated_movies
    parsed_data = get_url('movie/top_rated')
    get_movie_data(parsed_data[:results])
  end

  def search_movies(query)
    parsed_data = get_url("search/movie?query=#{query}")
    get_movie_data(parsed_data[:results])
  end

  def get_movie_data(response_data)
    response_data.map do |movie_data|
      {
        title: movie_data[:title],
        rating: movie_data[:vote_average]
      }
    end
  end

  def get_url(url)
    response = conn.get(url) do |req|
      req.headers['Authorization'] = "Bearer #{ENV['MOVIES_API_READ_ACCESS_TOKEN']}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.themoviedb.org/3', headers: { 'Content-Type' => 'application/json' })
  end
end
