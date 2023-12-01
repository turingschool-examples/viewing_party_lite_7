class MovieSearchService

# def movie_search(search)
#   conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
#     faraday.params['api_key'] = Rails.application.credentials.tmdb[:key]
#   end
#   search_term = params[:search]

#   response = conn.get("/3/search/movie?query=#{search_term}")
#   JSON.parse(response.body, symbolize_names: true)
# end
  def movie_search(search_term)
    get_url("/3/search/movie?query=#{search_term}")
  end

  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.tmdb[:key]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
