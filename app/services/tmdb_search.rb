class TmdbSearch 

  def movie_search(search)
    MovieSearch.new(service.search_url(search))
  end 

  def service
    TmdbService.new
  end
end