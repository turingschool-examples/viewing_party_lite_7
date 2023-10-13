class Review
  attr_reader :author, :content, :rating

  def initialize(review_data)
    @author = review_data[:author]
    @content = review_data[:content]
    @rating = review_data[:rating]
  end
end