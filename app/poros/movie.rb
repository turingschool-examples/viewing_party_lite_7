class Movie
  attr_reader :id,
              :rating,
              :runtime,
              :overview,
              :title


  def initialize(info)
    @cast_data    = info.dig(:credits, :cast)
    @genres_data  = info.dig(:genres)
    @id           = info.dig(:id)
    @rating       = info.dig(:vote_average)
    @reviews_data = info.dig(:reviews, :results)
    @runtime      = info.dig(:runtime)
    @overview     = info.dig(:overview)
    @title        = info.dig(:title)
  end

  def cast_list
    @cast_data.first(10).map do |cast_member_data|
      CastMember.new(cast_member_data)
    end
  end

  def reviews
    @reviews_data.first(10).map do |review_data|
      Review.new(review_data)
    end
  end

  def runtime_formatted
    hrs_min = runtime.divmod(60)

    "#{hrs_min[0]}hr #{hrs_min[1]}min"
  end

  def genres
    if @genres_data
      @genres_data.map { |genre| genre[:name] }
    end
  end
end
