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

  delegate :name, to: :user, prefix: true
end
