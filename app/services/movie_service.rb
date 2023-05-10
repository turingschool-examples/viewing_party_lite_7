require 'faraday'

class MovieService
  def movies(query)
    get_url("https://api.themoviedb.org/3/search/movie?language=en-US&query=#{query}&include_adult=false")
  end

  def get_url(url)
    response = Faraday.new(url: url).get do |faraday|
      faraday.headers["Authorization"] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2Zjk3MDk2OWQyYWE5NDJmOTA2YmI0MGNjMWY2MmUyMCIsInN1YiI6IjY0NTliY2RlYWUzODQzMDExYjUxODU2NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.z7oDek4ow3wESMafRwa0Hlte66LPdTmTGBfsWsFC6C0'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end