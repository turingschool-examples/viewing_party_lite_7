class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties

  def matched_parties
    Party.joins(:user_parties).where(user_parties: { user_id: self.id })
  end

  def get_host_parties
    Party.where(user_id: self.id)
  end
end