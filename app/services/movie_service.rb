class MovieService 
  


  def conn 
    Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.headers['Authorization'] = ENV['TMDB_AUTH']
    end
  end
end