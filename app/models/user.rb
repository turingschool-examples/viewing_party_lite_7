class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  validates :name, presence: true
  validates :email, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password

  def hosted_parties
    viewing_parties.where(user_viewing_parties: { host: true })
  end

  def invited_parties
    viewing_parties.where(user_viewing_parties: { host: false })
  end
end
