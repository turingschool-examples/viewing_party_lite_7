class ReviewMapper
  def self.map_review_details(review_data)
    review_data["results"].map do |review|
      Review.new(
        author: review["author"],
        content: review["content"]
      )
    end
  end
end