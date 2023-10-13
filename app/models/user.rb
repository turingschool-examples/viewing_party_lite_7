class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  def self.user_host_name(id)
    user = User.find(id)
    user.name
  end
end