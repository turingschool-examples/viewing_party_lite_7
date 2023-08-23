class Movie
  attr_reader :name,
              :vote_average,
              :runtime,
              :genre,
              :summary,
              :top_10,
              :total_reviews,
              :review_authors

  def initialize(attributes)
    @name           = attributes[:name]
    @vote_average   = attributes[:vote_average]
    @runtime        = attributes[:runtime]
    @genre          = attributes[:genre]
    @summary        = attributes[:summary]
    @top_10         = attributes[:top_10]
    @total_reviews  = attributes[:total_reviews]
    @review_authors = attributes[:review_authors]
  end
end