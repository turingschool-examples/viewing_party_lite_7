class MovieReview
  attr_reader :author, 
              :name,
              :username,
              :avatar_path,
              :rating

  def initialize(attributes)
    @author = attributes[:author]
    @name = attributes[:name]
    @username = attributes[:username]
    @avatar_path = attributes[:avatar_path]
    @rating = attributes[:rating]
  end
end

