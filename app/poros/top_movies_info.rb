class TopMoviesInfo
  attr_reader :title,
              :summary,
              :vote_average

  def initialize(info)
    @title = info[0]
    @summary = info[1]
    @vote_average = info[2]
  end
end