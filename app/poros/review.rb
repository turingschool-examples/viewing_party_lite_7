class Review
  attr_reader :author,
              :author_details

  def initialize(review_params)
    @author = review_params[:author]
    @author_details = review_params[:author_details]
  end
end