class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates :duration, presence: true
  validates :party_date, presence: true
  validates :party_time, presence: true
  validates :host_id, presence: true
end
