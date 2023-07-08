class Review
  attr_reader :author, :author_details, :username, :avatar, :rating

  def initialize(attributes)
    @author = attributes[:author]
    @author_details = attributes[:author_details]
    @username = attributes[:author_details][:username]
    @avatar = attributes[:author_details][:avatar_path]
    @rating = attributes[:author_details][:rating]
  end
end