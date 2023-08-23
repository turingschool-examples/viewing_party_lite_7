class DiscoverMovie
  attr_reader :name,
              :vote_average,
              :runtime,
              :genre,
              :summary,
              :top_10,
              :total_reviews,
              :review_authors

  def initialize(attributes)
    @name           = attributes[:title]
    @vote_average   = attributes[:vote_average]
    @runtime        = runtime
    @genre          = attributes[:genre_ids]
    @summary        = attributes[:overview]
    @top_10         = top_10
    @total_reviews  = attributes[:vote_count]
    @review_authors = review_authors
  end

  # runtime, top_10, and review_authors are not associated with the API
end