class MovieData
  def initialize(data)
    @id = data[:details][:id]
    @title = data[:details][:title]
    @runtime = data[:details][:runtime]
    @vote_average = data[:details][:vote_average]
    @genre = data[:details][:genres].map { |genre| genre[:name] }.join(', ')
    @summary = data[:details][:overview]
    @credits = credits(data[:credits])
    @reviews = reviews(data[:reviews])
  end

  def genres(details_data)
    details_data[:genres].map do |genre| 
      genre[:name] 
    end.join(', ')
  end

  def credits(credits_data)
    count = 0
    cast = Hash.new
    until count == 10
      cast[credits_data[count][:name]] = credits_data[count][:character]
      count += 1
    end
    cast
  end

  def reviews(reviews_data)
    reviews_data.map do |review|
      [review[:author], review[:content]]
    end
  end
end