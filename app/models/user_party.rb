class UserParty < ApplicationRecord
  validates :party, presence: true
  validates :user, presence: true

  belongs_to :party
  belongs_to :user
end
