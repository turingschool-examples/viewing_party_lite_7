class MovieService
  def top_rated_movies
    JSON.parse(conn.get('movie/top_rated').body, symbolize_names: true)
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end


  # private
  def conn
    Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params['api_key'] = ENV['MOVIE_API_KEY']
    end
  end
end
