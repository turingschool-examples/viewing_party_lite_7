class MovieSearch
  attr_reader :search_results
  def initialize(data)
    @search_results = data[:results]
  end
end