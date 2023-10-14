class Review
  attr_accessor :author, :username, :content

  def initialize(data)
    @author = data[:author]
    @username = data[:author_details][:username]
    @content = data[:content]
  end

  def self.from_api_response(response)
    reviews_data = response['results']
    reviews_data.map { |data| new(data) }
  end
end
