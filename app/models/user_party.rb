class UserParty < ApplicationRecord
  validates_presence_of :user,
                        :party

  belongs_to :user
  belongs_to :party
end