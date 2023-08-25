class Movie
  attr_reader :genres,
              :id,
              :rating,
              :runtime,
              :overview,
              :title

  def initialize(info)
    @id           = info[:id]
    @title        = info[:title]
    @rating       = info[:vote_average]
    @runtime      = info[:runtime] || []
    @overview     = info[:overview] || []
    @cast_data    = info.dig(:credits, :cast) || []
    @reviews_data = info.dig(:reviews, :results) || []
    @genres       = info[:genres]&.map { |genre| genre[:name] } || []
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
end
