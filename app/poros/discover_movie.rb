class DiscoverMovie
  attr_reader :title,
              :vote_average,
              :runtime,
              :genre_ids,
              :overview,
              :top_10,
              :vote_count,
              :review_authors

  def initialize(attributes)
    @title           = attributes[:title]
    @vote_average   = attributes[:vote_average]
    @runtime        = attributes[:runtime]
    @genre_ids          = attributes[:genre_ids]
    @overview        = attributes[:overview]
    @top_10         = attributes[:top_10]
    @vote_count  = attributes[:vote_count]
    @review_authors = attributes[:review_authors]
  end
  
  # runtime, top_10, and review_authors are not associated with the API
end