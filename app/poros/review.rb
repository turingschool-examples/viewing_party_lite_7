# frozen_string_literal: true

# app/poros/review.rb
class Review
  attr_reader :content, :author, :rating, :total_results

  def initialize(data, total_results)
    @content = data[:content]
    @author = data[:author]
    @rating = author_rating(data)
    @total_results = total_results
  end

  def author_rating(data)
    data[:author_details][:rating].to_i
  end
end
