class User < ApplicationRecord
  has_many :viewing_parties

  validates :name, presence: true
  validates :email, presence: true
end
