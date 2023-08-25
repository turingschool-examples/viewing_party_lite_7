class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

  def invitees
    User.where.not(id: id)
  end

  def hosted_parties
    parties.where(user_parties: { host: true })
  end

  def invited_parties
    parties.where(user_parties: { host: false })
  end
end