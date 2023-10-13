class Movie
  attr_reader :id, :title, :vote_average, :runtime, :genres, :overview, :backdrop_path

  def initialize(data)
    @id = data[:id]
    @backdrop_path = data[:backdrop_path]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime] # will need to accounr for formatting
    @genres = data[:genres] # will need to create format method, also account for sad path as some movies may not have explicit genres
    @overview = data[:overview]

    def convert_time
      if @runtime > 60
        "#{@runtime/60}h #{@runtime % 60}min"
      else
        "#{@runtime}min"
      end
    end

    def format_genres
      formatted = "" 
      @genres.map do |genre|
        if genre != @genres.last
          formatted += "#{genre[:name]}, "
        else
          formatted += genre[:name]
        end
      end
      formatted
    end
  end
end