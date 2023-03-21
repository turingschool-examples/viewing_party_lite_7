class ViewingPartyUser < ApplicationRecord
  belongs_to :user
  belongs_to :viewingparty
end
