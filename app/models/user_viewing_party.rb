class UserViewingParty < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party

  enum user_type: ['visitor', 'host']
end
