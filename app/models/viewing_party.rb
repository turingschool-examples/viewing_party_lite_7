class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  def invitees
    UserViewingParty.select("user_viewing_parties.*, users.name, users.id").joins(:user).where("user_viewing_parties.viewing_party_id = #{self.id}")
  end
end