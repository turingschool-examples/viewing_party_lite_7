class Review
    attr_reader :author, :have_content
    
    def initialize(review_data)
        @author = review_data[:author]
        @content = review_data[:content]
    end
end