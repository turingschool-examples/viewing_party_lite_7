class MoviesService

  def get_url(link)
    temp_data = conn.get(link)
    JSON.parse(temp_data.body, symbolize_name: true)
  end

  def conn
    Faraday.new(
      url: "https://api.themoviedb.org/3/", params: {api_key: Rails.application.credentials.movie_db[:key]})
  end

  def top_20
    get_url("movie/top_rated")
  end

  def movie_search(keyword)
    get_url("search/movie?query=#{keyword}")
  end

  def find(id)
    get_url("movie/#{id}")
  end

  def cast(id)
    get_url("movie/#{id}/credits")
  end

  def reviews(id)
    get_url("movie/#{id}/reviews")
  end
end