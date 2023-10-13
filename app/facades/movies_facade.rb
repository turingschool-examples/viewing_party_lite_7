# frozen_string_literal: true

# app/facades/movies_facade.rb
class MoviesFacade
  def initialize(movie_id = nil)
    @movie_id = movie_id.to_i
  end

  def movie
    Movie.new(MovieService.new.movie(@movie_id))
  end

  def cast
    data = MovieService.new.cast(@movie_id)
    data.map do |cast_data|
      Cast.new(cast_data)
    end
  end

  def reviews
    data = MovieService.new.reviews(@movie_id)
    data[:results].map do |review_data|
      Review.new(review_data, data[:total_results])
    end
  end

  def movie_search(search)
    data = MovieService.new.movie_search(search)
    data[:results].map do |movie_data|
      MovieIndex.new(movie_data)
    end
  end

  def movie_discover
    data = MovieService.new.movie_discover[:results][0..19]
    data.map do |movie_data|
      MovieIndex.new(movie_data)
    end
  end
end
