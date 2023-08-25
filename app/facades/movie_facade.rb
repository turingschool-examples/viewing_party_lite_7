# frozen_string_literal: true

class MovieFacade
  def self.top_movies
    MovieService.top_rated_movies[:results].map do |movie_data| # #<-- top_rated_movies is a method in the MovieService class
      Movie.new(movie_data)
    end
  end

  def self.search_movies_by_title(title)
    MovieService.search_by_title(title)[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.get_movie(id)
    movie_data = MovieService.find_by_id(id)
    Movie.new(movie_data)
  end

  def self.get_cast(id)
    MovieService.cast(id)[:cast][0..9].map do |cast_data|
      "#{cast_data[:name]} as #{cast_data[:character]}"
    end
  end

  def self.get_reviews(id)
    MovieService.reviews(id)[:results].map do |review_data|
      Review.new(review_data)
    end
  end

  def self.count_reviews(id)
    MovieService.reviews(id)[:results].map do |review_data|
      Review.new(review_data)
    end.count
  end
end
