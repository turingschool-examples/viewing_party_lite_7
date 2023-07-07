class Details
  attr_reader :title, :vote_average, :runtime, :genres, :summary

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = format_time(data[:runtime])
    @genres = data[:genres]
    @summary = data[:overview]
  end

  def format_time(i)
    mod = i % 60
    hours = i / 60
    
    "#{hours}h #{mod}m"
  end
end