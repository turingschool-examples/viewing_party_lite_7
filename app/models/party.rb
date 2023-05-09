class Party < ApplicationRecord
  has_many :partygoers
  has_many :users, through: :partygoers
end
