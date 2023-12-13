class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :password_digest

  has_secure_password

  has_many :user_parties
  has_many :parties, through: :user_parties
end
