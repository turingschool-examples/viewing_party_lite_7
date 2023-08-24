class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :cast,
              :total_reviews,
              :reviews,
              :image
  def initialize(data)
    @id = data[:id]
    @title = data[:original_title]
    @image = data[:backdrop_path]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = format_genres(data[:genres])
    @summary = data[:overview]
    @cast = generate_cast(data[:credits][:cast])
    @total_reviews = data[:reviews][:total_results]
    @reviews = generate_reviews(data[:reviews][:results])
  end

  def format_genres(genres)
    genres.map { |genre| genre[:name] }.join(", ")
  end

  def generate_cast(cast)
    cast.map { |cast_member| CastMember.new(cast_member) }[0..9]
  end

  def generate_reviews(reviews)
    reviews.map { |review| Review.new(review)}
  end

  def format_runtime
    "#{@runtime / 60}hr #{@runtime % 60 }min"
  end

end

