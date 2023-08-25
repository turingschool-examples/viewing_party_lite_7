class ViewingParty < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_many :party_guests
  has_many :users, through: :party_guests

  def movie_image_url(movie_images)
    if movie_images[movie_id].present?
      "https://image.tmdb.org/t/p/w500#{movie_images[movie_id]}"
    else
      'path/to/your/default/image.jpg'
    end
  end

  def movie_title_link(movies, user)
    movie_title = movies[movie_id]
    movie_link = user_movie_show_path(user_id: user.id, movie_id:)
    [movie_title, movie_link]
  end
end
