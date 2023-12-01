class Movie
  attr_reader :title, :vote_average, :id, :summary, :reviews

  def initialize(data)
    @title = data[:original_title]
    @id = data[:id]
    @vote_average = data[:vote_average].round(1)
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
    @cast = actor_details(data)
    @reviews = review_details(data) 
  end

  def convert_runtime
    hours = @runtime / 60
    remaining_min = @runtime % 60 
    "#{hours}:#{remaining_min}"
  end

  def all_genres
    genres_names = @genres.map do |genre|
      genre[:name]
    end
    genres_names.join(', ')
  end

  def actor_details(data)
    if data[:cast]
      cast = data[:cast].first(10).map do |actor|
        { actor: actor[:name], character: actor[:character] }
      end
    else
      return nil
    end
  end

  def all_cast
    cast = @cast.map do |c|
      "#{c[:character]} Played by: #{c[:actor]}"
    end
  end

  def review_details(data)
    if data[:results]
      reviews = data[:results].map do |review|
        { author: review[:author], content: review[:content] }
      end
    else
      return nil
    end
  end
end