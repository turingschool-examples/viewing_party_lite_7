class TmbdService
  
  def self.top_rated_movies
    get_url('/3/movie/top_rated')
  end
  
  def self.search_movies(search)
    get_url("/3/search/movie?query=#{search}")
  end 

  def self.find_movie(id)
    get_url("/3/movie/#{id}")
  end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['tmbd_key']
    end
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end