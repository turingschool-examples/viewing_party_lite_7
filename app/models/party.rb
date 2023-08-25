class Party < ApplicationRecord
  validates_presence_of :movie_id
  validates_presence_of :duration
  validates_presence_of :date
  validates_presence_of :start_time
  validates_presence_of :host_id
  validates_presence_of :movie_title
  validates_presence_of :thumbnail

  has_many :user_parties
  has_many :users, through: :user_parties

  def invited_users
    User.joins(user_parties: :party)
        .where(parties: {movie_id: movie_id})
        .group(:name)
        .pluck(:name)
  end
end