class ViewingUser < ApplicationRecord
  belongs_to :User
  belongs_to :ViewingParty
end
