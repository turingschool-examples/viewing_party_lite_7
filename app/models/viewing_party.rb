class ViewingParty < ApplicationRecord
  belongs_to :user
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  def other_users
    self.viewing_party_users.map do |vpu|
      vpu.user.name
    end
  end
end
