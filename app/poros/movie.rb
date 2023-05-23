# class Movie
#   attr_reader :id,
#               :title,
#               :vote_average

#   def initialize(data)
#     @id = data[:id]
#     @title = data[:title]
#     @vote_average = data[:vote_average]
#   end
# end

class Movie
  attr_reader :id,
  :title,
  :summary,
  :vote_average,
  :vote_count,
  :poster_path,
  :total_min,
  :cast,
  :genres,
  :reviews,
  :runtime

  def initialize(data)
    @id           = data[:id]
    @title        = data[:title]
    @summary      = data[:overview]
    @vote_average = data[:vote_average]
    @poster_path  = data[:poster_path]
    @total_min    = data[:total_min]
    @runtime      = data[:runtime]
    @cast         = data[:cast]
    @genres       = data[:genres]
  end

  def format_runtime
    if @runtime >= 120
      "#{@runtime / 60} hours #{@runtime % 60} minutes"
    else
      "#{@runtime / 60} hour #{@runtime % 60} minutes"
    end
  end

  def format_genres
    @genres.map do |genre|
      genre[:name]
    end.join(', ')
  end
end