class UserParty < ApplicationRecord
  belongs_to :parties
  belongs_to :users
  validates :party_id, presence: true, numericality: true
  validates :user_id, presence: true, numericality: true

end