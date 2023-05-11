class Review
  attr_reader :author,
              :content

  def initialize(data)
    @author = data[:author]
    @content = data[:content]
    @total_results = data[:total_results]
  end
end