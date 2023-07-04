class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates :date, presence: true
  validates :time, presence: true
  validates :duration, numericality: { only_integer: true }
end