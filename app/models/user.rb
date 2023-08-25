class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

  def invitees
    User.where.not(id: id)
  end
end