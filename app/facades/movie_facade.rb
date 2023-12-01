class MovieFacade
  attr_reader :search

  def initialize(search)
    @search = search
  end

  def movies
    service = MovieService.new
    data = if !@search.nil?
             service.search(@search)
           else
             service.top_rated_20
           end

    @movies = data[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def movie
    data = service.get_movie(@search)

    Movie.new(data)
  end

  def cast_members
    data = service.get_cast_member(@search)

    data[:cast].map do |cast_data|
      CastMember.new(cast_data)
    end.first(10)
  end

  def reviews
    data = service.get_reviews(@search)

    data[:results].map do |review|
      Review.new(review)
    end
  end

  def service
    MovieService.new
  end
end
