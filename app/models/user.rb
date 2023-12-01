class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties
  validates :name, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP, presence: true, uniqueness: true
end