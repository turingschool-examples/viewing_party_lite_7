class MovieService
  def self.top_20_flicks
    get_url("/3/movie/top_rated")
  end

  def self.movie_search
    get_url("/3/search/movie")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://www.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["f4a7c872399d352b616cad623bf1d25e"]
    end
  end
end