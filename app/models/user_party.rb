class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :party

  def hosting?
    host == true
  end
end