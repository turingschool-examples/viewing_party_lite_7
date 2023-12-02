class Movie
  attr_reader :title, 
              :vote_average, 
              :id, :summary, 
              :reviews, 
              :runtime, 
              :image

  def initialize(data)
    @title = data[:original_title]
    @id = data[:id]
    @vote_average = data[:vote_average].round(1)
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
    @cast = actor_details(data)
    @reviews = review_details(data)
    @image = data[:backdrop_path]
  end

  def convert_runtime
    hours = @runtime / 60
    remaining_min = @runtime % 60 
    "#{hours}:#{remaining_min}"
  end

  # Refactor in future, encapsulate in private method similar to other #_details methods
  def all_genres
    genres_names = @genres.map do |genre|
      genre[:name]
    end
    genres_names.join(', ')
  end

  # Refactor in future, change to #cast_details similar to other methods
  # Probably better to provide @cast as object usable for FE View work
  def all_cast
    cast = @cast.map do |c|
      "#{c[:character]} Played by: #{c[:actor]}"
    end
  end

  private 
  # These two methods are only used here to setup instance variables
  # Can encapsulate them in private method block
  def actor_details(data)
    if data[:cast]
      cast = data[:cast].first(10).map do |actor|
        { actor: actor[:name], character: actor[:character] }
      end
    else
      return nil
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