class Party < ApplicationRecord
  validates_presence_of :duration_minutes, 
                       :start_time, 
                       :date,
                       :movie_id,
                       :host_id

  has_many :party_users
  has_many :users, through: :party_users

  def get_all_info
    movie = MoviedbFacade.new(movie_id: movie_id).all_movie_info
    host = User.find(host_id)
    all_party_info = {
      party_id: id,
      movie_id: movie.movie_id,
      image: "https://image.tmdb.org/t/p/w154#{movie.image}", 
      title: movie.title, 
      duration_minutes: duration_minutes, # party duration (type self into pry)
      date: date, 
      start_time: start_time, 
      host: host.name, 
      attendees: users #grabbing from join table association!?!wild?!
    }
  end
end