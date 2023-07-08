class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates :user_name, presence: true
  validates :email, presence: true, uniqueness: true

  def invitees
    User.where.not(id: id)
  end
end
