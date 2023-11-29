class Movie
  attr_reader :title,
              :duration,
              :average_vote,
              :genre,
              :cast,
              :reviews,
              :summary

  def initialize(attributes)
    @name = attributes[:name]
    @role = attributes[:role]
    @party = attributes[:party]
    @district = attributes[:district]
  end
end
