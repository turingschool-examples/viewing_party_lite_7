class Review
  attr_reader :total_reviews, :author, :content, :rating
  def initialize(review, total_results)
    @total_reviews = total_results
    @author = review[:author]
    @content = review[:content]
    @rating = review[:author_details][:rating]
  end

  def format_genre

  end
end