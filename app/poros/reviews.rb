class Reviews
  attr_reader :reviews, :results

  def initialize(data)
    @reviews = data[:results]
    @results = data[:total_results]
  end
end