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
    MovieFacade.new.find_movie(movie_id).title
  end

  def movie_image_src
    "https://image.tmdb.org/t/p/original#{MovieFacade.new.find_movie(movie_id).image}"
  end
end
