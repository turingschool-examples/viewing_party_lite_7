class UserParty < ApplicationRecord
  belongs_to :party
  belongs_to :user
  validates :party_id, presence: true, numericality: true
  validates :user_id, presence: true, numericality: true

end