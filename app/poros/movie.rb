class Movie
  attr_reader :title, :vote_average, :id

  def initialize(data)
    @title = data[:original_title]
    @id = data[:id]
    @vote_average = data[:vote_average].round(1)
    @runtime = data[:runtime]
  end

  def convert_runtime
    hours = @runtime / 60
    remaining_min = @runtime % 60 
    "#{hours}:#{remaining_min}"
  end
end