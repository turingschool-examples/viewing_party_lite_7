class MovieService
  def top_rated_movies
    response = conn.get('movie/top_rated') do |req|
      req.headers['Authorization'] = "Bearer #{ENV['MOVIES_API_READ_ACCESS_TOKEN']}"
    end
    parsed = JSON.parse(response.body, symbolize_names: true)
    movies = parsed[:results].map do |movie_data|
      {
        title: movie_data[:title],
        rating: movie_data[:vote_average]
      }
    end
  end

  def search_movies(query)
    response = conn.get("search/movie?query=#{query}") do |req|
      req.headers['Authorization'] = "Bearer #{ENV['MOVIES_API_READ_ACCESS_TOKEN']}"
    end
    parsed = JSON.parse(response.body, symbolize_names: true)
    movies = parsed[:results].map do |movie_data|
      {
        title: movie_data[:title],
        rating: movie_data[:vote_average]
      }
    end
  end

  def conn
    Faraday.new(url: 'https://api.themoviedb.org/3', headers: { 'Content-Type' => 'application/json' })
  end
end
