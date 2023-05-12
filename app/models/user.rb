class User < ApplicationRecord
  has_many :hosted_parties, class_name: 'Party', foreign_key: 'user_id', dependent: :destroy
  has_many :partygoings, dependent: :destroy
  has_many :invited_parties, through: :partygoings, source: :party  

  validates :name, presence: true
  validates :email, 
            presence: true, 
            uniqueness: { case_sensitive: false }, 
            format: {with: URI::MailTo::EMAIL_REGEXP }
end