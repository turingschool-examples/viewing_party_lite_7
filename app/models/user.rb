# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true

  has_secure_password

  def self.user_host_name(id)
    user = User.find(id)
    user.name
  end

  def self.all_users_except_self(user)
    User.excluding(user)
  end
end
