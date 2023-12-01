class Review
  attr_reader :author, :content, :rating
  def initialize(review)
    @author = review[:author]
    @content = review[:content]
    # @rating = review[:author_details][:rating]
  end
end