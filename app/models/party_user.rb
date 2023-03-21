class PartyUser < ApplicationRecord
  validates_presence_of :party_id, 
                        :user_id,
                        :host_id

  belongs_to :party
  belongs_to :user
end