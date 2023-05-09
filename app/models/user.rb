class User < ApplicationRecord
  has_many :partygoers
  has_many :parties, through: :partygoers
end
