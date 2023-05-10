class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  #Look into refactoring (at some point)
  def hosted_parties
    Party.where("host_id = ?", self.id)
  end
end
