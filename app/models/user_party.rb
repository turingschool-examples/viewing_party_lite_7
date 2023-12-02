class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :party

  def host
    User.find(host_id)
  end
end