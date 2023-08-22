class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates :movie_title, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
end
