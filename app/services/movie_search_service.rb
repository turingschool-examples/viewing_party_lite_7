# frozen_string_literal: true

class MovieSearchService
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
