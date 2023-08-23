class MoviesFacade
  def initialize(search)

  end

  def top20rated
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["Authorization"] = ENV["TMBD_API_KEY"]
    end

    response = conn.get("/3/movie/top_rated?language=en-US&with_original_language=en&page=1")

    json = JSON.parse(response.body, symbolize_names: true)
    @top20rated = json[:results].first(20).map do |movie_data|
      Movie.new(movie_data)
    end
  end
end