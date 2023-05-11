class MovieDataService

  def top_rated_movies
    get_url('/3/movie/top_rated')
  end

  def search_movies(search)
    get_url("/3/search/movie?query=#{search}")
  end

  def find_movie(id)
    get_url("/3/movie/#{id}")
  end

  def find_reviews(id)
    get_url("/3/movie/#{id}/reviews")
  end

  def find_cast(id)
    get_url("/3/movie/#{id}/credits")
  end


  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['TMBD_API_KEY']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end