class User < ApplicationRecord
  validates_presence_of :email,
                        :name

  validates :email, uniqueness: true
  has_many :viewing_users
  has_many :viewing_parties, through: :viewing_users
end
