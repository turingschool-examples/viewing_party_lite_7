class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    has_many :viewing_party_users
    has_many :viewing_parties, through: :viewing_party_users
    has_many :viewing_parties
end
