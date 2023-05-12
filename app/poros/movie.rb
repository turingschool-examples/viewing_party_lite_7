# so movies from API can be converted to POROs
class Movie
  attr_reader :title, :id, :vote_average, :runtime, :genres, :overview

  def initialize(data)
    @title = data[:title]
    @id = data[:id]
    @vote_average = data[:vote_average]
    @runtime = is_nil?(data[:runtime])
    @genres = extract_genres(data[:genres])
    @overview = data[:overview]
  end

  def format_runtime
    "#{@runtime / 60} hours #{@runtime % 60} minutes"
  end

  def is_nil?(data)
    data == nil ? nil : data
  end

  def extract_genres(data)
    return if data.nil?

    data.map do |genre|
      genre.dig(:name)
    end
  end
end
