class UserViewingParty < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party

  enum user_type: { 'visitor' => 0, 'host' => 1 }
  validates :user_id, presence: true, numericality: true
  validates :viewing_party_id, presence: true, numericality: true
end
