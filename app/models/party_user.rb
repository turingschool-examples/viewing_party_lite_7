# PartyUser model. This model is used to create a join table between
class PartyUser < ApplicationRecord
  belongs_to :user
  belongs_to :party

  validates_presence_of :user_id, :party_id
end
