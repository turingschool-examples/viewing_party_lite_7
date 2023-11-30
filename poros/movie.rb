class Movie
  attr_reader :vote_avg,
              :title,
              :summary,
              :movie_id,
              :genre,
              :runtime,
              :cast_names,
              :cast_roles,
              :review_author,
              :review_details,
              :review_count


  def initialize(details)
    @movie_id = details[:id]
    @vote_avg = details[:vote_average]
    @title = details[:original_title]
    @runtime = details[:runtime]
    # this needs to be parsed into a string (currently array of ids)
    @genre = details[:genres]
    @summary = details[:overview]
    @cast_names = details[:name]
    @cast_roles = details[:character]
    @review_count = details[:total_results] 
    @review_author = details[:author] 
    @review_details = details[:content]
  end

  def genre_name 
    @genre.map do |genre|
      genre[:name]
    end
  end

  def runtime_hrs_and_mins
    "#{@runtime/60}h #{@runtime % 60}min"
  end

end
