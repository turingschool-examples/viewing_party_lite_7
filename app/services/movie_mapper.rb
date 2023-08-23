class MovieMapper
  def self.map_to_movies(data)
    data[0..19].map do |movie_data|
      Movie.new(
        title: movie_data['title'],
        id: movie_data['id'],
        vote_average: movie_data['vote_average']
      )
    end
  end
end
