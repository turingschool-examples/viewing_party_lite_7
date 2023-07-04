class Party < ApplicationRecord
  validates :duration, presence: true
  validates :party_date, presence: true
  validates :party_time, presence: true

  has_many :user_parties
  has_many :users, through: :user_parties
end
