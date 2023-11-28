class Party < ApplicationRecord
  validates :duration, presence: true, numericality: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :movie_id, presence: true, numericality: true

  has_many :user_parties
  has_many :users, through: :user_parties
end
