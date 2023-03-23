class MovieFacade
  def self.get_movie(id)
    info = MovieService.get_movie(id)
    poro = MovieInfo.new(info)
    
    # binding.pry
  end
  
  
  # def self.top_rated
  #   result = MovieService.top_rated[:results]
  # 
  #   # binding.pry
  # end
  
end