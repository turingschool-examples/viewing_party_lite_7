class User < ApplicationRecord
	has_many :user_parties
	has_many :parties, through: :user_parties
	validates :email, uniqueness: true,
										presence: true,
										format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end