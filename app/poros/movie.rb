class Movie
  attr_reader :title,
              :vote_average,
              :id,
              :summary,
              :genres,
              :runtime,
              :cast,
              :reviews,
              :review_count,
              :minutes,
              :poster

              # as attrs are added, be sure to test for them in PORO spec
  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @id = data[:id]
    @summary = data[:overview]
    @genres = create_genre_array(data)
    @runtime = create_runtime(data)
    @cast = create_cast_array(data)
    @reviews = create_review_array(data)
    @review_count = create_review_count(data)
    @minutes = data[:runtime]
    @poster = data[:poster_path]
  end

  def create_genre_array(data)
    if data[:genres]
      data[:genres].map { |genre| genre[:name] }
    else 
      []
    end
  end

  def create_runtime(data) 
    if data[:runtime]
      hours = data[:runtime] / 60
      minutes = (data[:runtime] % 60)
      "#{hours}:#{minutes}"
    else
      nil
    end
  end

  def create_cast_array(data) 
    if data[:credits]
      data[:credits][:cast][0..9].map do |member|
        member[:name] + ', as ' + member[:character]
      end
    else
      []
    end
  end

  def create_review_count(data)
    if data[:reviews]
      data[:reviews][:results].count 
    else
      nil
    end
  end

  def create_review_array(data)
    if data[:reviews]
      data[:reviews][:results].map do |result|
        {
          author: result[:author],
          name: result[:author_details][:name],
          username: result[:author_details][:username],
          rating: result[:author_details][:rating]
        }  
      end
    else
      []
    end
  end

end