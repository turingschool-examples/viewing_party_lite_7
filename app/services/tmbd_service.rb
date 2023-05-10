class TmbdService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['tmbd_key']
    end
  end

    def self.top_rated_movies
      response = conn.get('/3/movie/top_rated')

      JSON.parse(response.body, symbolize_names: true)
    end

    def self.search_movies(search)
      response = conn.get("/3/search/movie?query=#{search}")

      JSON.parse(response.body, symbolize_names: true)
    end
end