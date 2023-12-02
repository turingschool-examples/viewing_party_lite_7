class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :party


  def get_user_name
  user = User.find_by_id(self.user_id)
  user.present? ? user.name : "Unknown User"
end
end