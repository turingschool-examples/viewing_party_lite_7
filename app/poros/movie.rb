class Movie
  attr_reader :title, 
              :vote_average, 
              :id, 
              :summary, 
              :runtime,
              :genres,
              :cast,
              :reviews,
              :image

  def initialize(data)
    @title = data["original_title"]
    @vote_average = data["vote_average"]
    @id = data["id"]
    @summary = data["overview"]
    @runtime = data["runtime"]
    @genres = genre_finder(data)
    @cast = actor_details(data)
    @reviews = review_details(data)
    @image = data["backdrop_path"]
  end

  private 

  def genre_finder(data)
    if data["genres"]
      data["genres"].map { |genre| genre["name"]}.join(", ")
    else
      return nil
    end
  end
  
  def actor_details(cast_details)
    if cast_details["cast"]
      cast_details["cast"].first(10).map do |actor|
        { "actor" => actor["name"], "character" => actor["character"] }
      end
    else
      return nil
    end
  end

  def review_details(reviews)
    if reviews["results"]
      reviews["results"].map do |review|
        { "author" => review["author"], "body" => review["content"] }
      end
    else
      return nil
    end
  end
end