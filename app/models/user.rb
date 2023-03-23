class User < ApplicationRecord 
  has_many :viewing_party_users 
  has_many :viewing_parties, through: :viewing_party_users

  validates_uniqueness_of :email
  validates_presence_of :name

  def self.create_new_user(user_params)
    create(user_params)
  end
end