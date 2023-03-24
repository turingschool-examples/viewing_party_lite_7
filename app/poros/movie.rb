class Movie
  attr_reader :title,
              :summary,
              :vote_average,
              :runtime,
              :genres,
              :cast,
              :total_review_count,
              :review_info,
              :movie_id,
              :title_show,
              :vote_average_show,
              :movie_id_show,
              :poster_path

  def initialize(info)
    @movie_id = info[:id]
    @title = info[:title]
    @vote_average = info[:vote_average]
    @title_show = info["title2"]
    @vote_average_show = info["vote_average2"]
    @summary = info["summary"]
    @runtime = info["runtime"]
    @genres = info["genres"]
    @cast = info["cast"]
    @total_review_count = info["total_reviews_count"]
    @review_info = info["review_info"]
    @movie_id_show = info["id"]
    @poster_path = info["poster_path"]
  end
end
