class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates :movie_id, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :start_time, presence: true

  def title(movie_id)
    MovieFacade.new.find_movie(movie_id).title
  end
end
