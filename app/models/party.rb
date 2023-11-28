class Party < ApplicationRecord
  has_many :party_movies
  has_many :movies, through: :party_movies
  has_many :user_parties
  has_many :users, through: :user_parties
  validates :duration, presence: true
  validates :name, presence: true
  validates :date, presence: true
  validates :start_time, presence: true

end