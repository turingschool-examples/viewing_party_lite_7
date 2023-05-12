class UserMovies
  attr_reader :type,
              :movies,
              :user,
              :query

  def initialize(type:, movies:, user:, query: nil)
    @type = type
    @movies = movies
    @user = user
    @query = query
  end

  def user_name
    user.name
  end
end
