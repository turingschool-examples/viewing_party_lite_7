# frozen_string_literal: true

class UserFacade
  attr_reader :user

  def initialize(user_id)
    @user = User.find(user_id)
  end

  def movie_poster_link(movie_id)
    response = MoviesService.new.movie_images(movie_id)
    url = response[:posters].first[:file_path]
    "https://image.tmdb.org/t/p/w185#{url}"
  end

  def get_movie_title(movie_id)
    response = MoviesService.new.movie_details(movie_id)
    response[:title]
  end
end
