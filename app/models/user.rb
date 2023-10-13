class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  def invited_parties_invitees
    User.joins(:viewing_parties).select(:viewing_parties.id).where("user_viewing_parties.user_id != #{self.id}")
  end

  def hosted_parties_invitees

  end

  def user_host_name(id)
    user = User.find(id)
    user.name
  end
end