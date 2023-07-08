class MovieService
  def self.movie_information
    response = Faraday.get 'https://api.themoviedb.org/3/discover/movie/'
    body = response.body
    JSON.parse(body, symbolize_names: true)
  end
end