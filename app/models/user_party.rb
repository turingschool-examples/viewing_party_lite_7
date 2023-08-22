class UserParty < ApplicationRecord
  belongs_to :parties
  belongs_to :users
end
