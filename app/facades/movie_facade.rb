class MovieFacade 

  attr_reader :movie_details, :url, :id

  def initialize(url, id)
    @id = id
    @url = url
  end

  def self.call(url, id)
    new(url, id).call
  end


  def call
    retrieve_movie
    movie_creation
  end
  
  def retrieve_movie
    @movie_details = MovieService.new(url, id).retrieve_movie_details
  end

  def movie_creation
    Movie.new(@movie_details)
  end
end