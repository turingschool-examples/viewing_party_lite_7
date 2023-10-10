class ViewingParty < ApplicationRecord
  has_many :users, through: :user_viewing_parties
  has_many :user_viewing_parties
  validates :duration, presence: true
  validates :day, presence: true
  validates :view_time, presence: true
end
