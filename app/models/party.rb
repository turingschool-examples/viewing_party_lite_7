# Party model that represents a party that a user can host or attend
class Party < ApplicationRecord
  has_many :party_users
  has_many :users, through: :party_users

  validates_presence_of :date,
                        :start_time,
                        :duration,
                        :movie_id,
                        :host_id

  def movie_title(movie_id)
    movie = MovieService.new.search_movies_by_id(movie_id)
    movie[:title]
  end

  def host_name
    host = User.find(self.host_id)
    host.name
  end

  def invited_users
    users.where.not(id: host_id)
  end
end
