class MovieInfo 
  attr_reader :movie_id, :title, :vote_avg, :summary

  def initialize(info)
    @movie_id = info[:top_movies][:movie_id]
    @title = info[:top_movies][:movie_title]
    @vote_avg = info[:top_movies][:movie_vote_avg]
    @summary = info[:top_movies][:movie_summary]
  end
end