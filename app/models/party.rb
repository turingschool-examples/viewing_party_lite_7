class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  def list_invitees
    require 'pry'; binding.pry
    self.users.joins(:user_parties).where(user_parties: {party_id: self.id}).where(user_parties: {invite_status: "invited"}).distinct
  end
end