class Movie
  def initialize(details)
    @vote_avg = details[:vote_average]
    @title = details[:original_title]
    # not included in current query
    @runtime = details[:]
    # this needs to be parsed into a string (currently array of ids)
    @genre = details[:genre_ids]
    @summary = details[:overview]
    # not included in current query
    @cast = details[:]
    # 2 review attributes needed
  end
end