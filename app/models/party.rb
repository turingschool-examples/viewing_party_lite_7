class Party < ApplicationRecord
  has_many :partygoers
  has_many :users, through: :partygoers

  def attendees_names
    users.where(partygoers: { host: false }).pluck(:user_name)
  end

  def host_name
    users.where(partygoers: { host: true }).pluck(:user_name).first
  end

  def movie_title
    MovieFacade.new(movie_id).find_movie.title
  end

  def movie_image_src
    "https://image.tmdb.org/t/p/original#{MovieFacade.new(movie_id).find_movie.image}"
  end
end
