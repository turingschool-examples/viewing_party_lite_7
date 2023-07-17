class User < ApplicationRecord
  validates_presence_of :email,
                        :name,
                        :password

  validates_uniqueness_of :email
  has_secure_password
  has_many :viewing_users
  has_many :viewing_parties, through: :viewing_users
end
