class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties
  validates :duration, presence: true
  validates :when, presence: true
  validates :start_time, presence: true
end
