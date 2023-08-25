class Movie
  attr_reader :genres,
              :id,
              :rating,
              :runtime,
              :summary,
              :title


  def initialize(info)
    @cast_data   = info[:credits][:cast]
    @genres      = info[:genres].map { |genre| genre[:name] }
    @id          = info[:id]
    @rating      = info[:vote_average]
    @reviews_data = info[:reviews][:results]
    @runtime     = info[:runtime]
    @summary     = info[:overview]
    @title       = info[:title]
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
