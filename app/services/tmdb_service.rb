class TmdbService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['TMDB_KEY']
    end
  end

  def self.top_rated_movies(page_number)
    response = conn.get("/3/movie/top_rated?&page=#{page_number}")

    JSON.parse(response.body, symbolize_names: true)
  end
end