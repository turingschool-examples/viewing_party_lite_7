class ViewingParty < ApplicationRecord
  validates_presence_of :movie_id

  has_many :user_parties
  has_many :users, through: :user_parties

  def get_data
    movie = MovieFacade.get_movie(movie_id)
    host = User.find(host_id)
    party_info = {
      movie_id: movie.id,
      image: "https://image.tmdb.org/t/p/w500/#{movie.image_url}",
      title: movie.title,
      duration: duration,
      date: party_date,
      time: party_time,
      host: host.name,
      attendees: users
    }
  end
end
