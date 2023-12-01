class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :party

  def get_user_name
    User.find(self.user_id).name
  end
  
end