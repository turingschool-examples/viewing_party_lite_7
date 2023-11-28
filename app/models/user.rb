class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties
  has_many :movies, through: :parties
  validates :duration, presence: true
  validates :name, presence: true
  validates :date, presence: true
  validates :start_time, presence: true

end