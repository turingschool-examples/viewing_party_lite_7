class PartyUser < ApplicationRecord
  validates_presence_of :party,
                        :user
  belongs_to :party
  belongs_to :user
end
