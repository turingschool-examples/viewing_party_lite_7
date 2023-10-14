class Movie
  attr_reader :title, :vote_average, :runtime, :genres, :summary, :id
  attr_accessor :cast, :reviews

  def initialize(movie_data)
    @title = movie_data[:original_title]
    @vote_average = movie_data[:vote_average]
    @runtime = movie_data[:runtime] 
    @genres = movie_data[:genres]   
    @summary = movie_data[:overview]
    @id = movie_data[:id]
    @cast = []
    @reviews = []
  end

  def self.all
  end

  def self.from_api_response(movie_data)
    Movie.new(
      title: movie_data[:original_title],
      vote_average: movie_data[:vote_average],
      runtime: movie_data[:runtime], # Ensure it's formatted as hours and minutes
      genres: movie_data[:genres],   # Ensure it's an array of genre names
      summary: movie_data[:overview],
      id: movie_data[:id]
    )
  end

  def add_cast(member)
    @cast << member
  end

  def add_review(review)
    @reviews << review
  end
  
  def formatted_runtime
    return 'N/A' if @runtime.nil?

    total_minutes = @runtime
    hours = total_minutes / 60
    minutes = total_minutes % 60

    if hours.positive? && minutes.positive?
      "#{hours} hours #{minutes} minutes"
    elsif hours.positive?
      "#{hours} hours"
    else
      "#{minutes} minutes"
    end
  end
end
