class MoviesService < ApplicationService
  def conn
    Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end
  end

  def get_url(url)
    conn.get(url)
  end

  def movie_search(keyword)
    json_parse(get_url("search/movie?query=#{keyword}"))
  end
end