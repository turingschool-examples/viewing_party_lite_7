class MovieSearch
  def service
    TmdbService.connect
  end

  def keyword_search(keyword)
    connection = service
    response = connection.get("/3/search/movie?query=#{keyword}&include_adult=false&page=1")
    data = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
  end

  def discover_popular
    connection = service
    response = connection.get("/3/discover/movie?include_adult=false&page=1&sort_by=popularity.desc")
    require 'pry'; binding.pry
    data = JSON.parse(response.body, symbolize_names: true)
  end
end