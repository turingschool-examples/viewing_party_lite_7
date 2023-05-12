class MovieData
  attr_reader :type,
              :data,
              :user,
              :query

  def initialize(type:, data:, user:, query: nil)
    @type = type
    @data = data
    @user = user
    @query = query
  end
end
