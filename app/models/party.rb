class Party < ApplicationRecord
  has_many :party_users
  has_many :users, through: :party_users

  validates :movie_id, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
end