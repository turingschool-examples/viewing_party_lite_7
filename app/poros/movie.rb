class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :cast,
              :total_reviews,
              :reviews
  def initialize(data)
    @id = data["id"]
    @title = data["original_title"]
    @image = data["backdrop_path"]
    @vote_average = data["vote_average"]
    @runtime = data["runtime"]
    @genres = format_genres(data["genres"])
    @summary = data["overview"]
    @cast = format_cast(data["credits"]["cast"])
    @total_reviews = data["reviews"]["total_results"]
    @reviews = format_reviews(data["reviews"]["results"])
  end

  def format_genres(genres)
    genres.map { |genre| genre["name"] }
  end

  def format_cast(cast)
    formatted = cast.map do |cast|
      {name: cast["name"], character: cast["character"]}
    end
    formatted[0..9]
  end

  def format_reviews(reviews)
    reviews.map do |review|
      {
        author: review["author"], 
        rating: review["author_details"]["rating"], 
        comments: review["content"]
      }
    end
  end

end

