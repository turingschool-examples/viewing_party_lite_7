class ViewingParty < ApplicationRecord
  has_many :party_guests
  has_many :users, through: :party_guests
end
