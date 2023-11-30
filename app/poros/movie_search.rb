class MovieSearch
  attr_reader :search_term, :title, :vote_average
  def initialize(search_term)
    @search_term = search_term
    @title = search_term[:title]
    @vote_average = search_term[:vote_average]
  end


end