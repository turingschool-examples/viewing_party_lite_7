class PopularMovieService
  def self.movie_information
    response = Faraday.get 'https://api.themoviedb.org/3/movie/popular'
    body = response.body
    JSON.parse(body, symbolize_names: true)
  end
end