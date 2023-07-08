class Review
  attr_reader :all_reviews,
              :review_count

  def initialize(data)
    @all_reviews = get_review_info(data[:results])
    @review_count = data[:total_results]
  end

  def get_review_info(review_details)
    review_data = review_details.map do |review|
      "#{review[:author]}'s review: #{review[:content]}"
    end
  end
end