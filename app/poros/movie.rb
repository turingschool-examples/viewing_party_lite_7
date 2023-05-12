# so movies from API can be converted to POROs
class Movie
  attr_reader :title, :id, :vote_average, :runtime, :genres, :overview

  def initialize(data)
    @title = data[:title]
    @id = data[:id]
    @vote_average = data[:vote_average]
    @runtime = format_runtime(data[:runtime])
    @genres = extract_genres(data[:genres])
    @overview = data[:overview]
  end

  def format_runtime(time)
    time == nil ? nil : "#{time/60} hours #{time % 60} minutes"
  end

  def extract_genres(data)
    unless data == nil
      data.map do |genre|
        genre.dig(:name)
      end
    end
  end
end
