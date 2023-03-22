class MoviesService

  def self.fetch_api(arg)
    response = connection.get(arg)
    x = JSON.parse(response.body, symbolize_names: true)
  end

  def self.connection
    url = "https://api.themoviedb.org/3/"
    Faraday.new(url: url)
  end
end