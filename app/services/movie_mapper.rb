class MovieMapper
  def self.top_results(data)
    data[0..19].map do |movie_data|
      Movie.new(
        title: movie_data['title'],
        id: movie_data['id'],
        vote_average: movie_data['vote_average']
      )
    end
  end

  def self.map_movie_details(movie_data)
    Movie.new(
      title: movie_data['title'],
      id: movie_data['id'],
      vote_average: movie_data['vote_average'],
      runtime: movie_data['runtime'],
      genres: genres(movie_data['genres']),
      summary: movie_data['overview']
    )
  end

  def self.genres(data)
    results = []
    data.each do |genre|
      results << genre["name"]
    end
    return results
  end
end
