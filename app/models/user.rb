class User < ApplicationRecord
  has_many :movie_watch_parties
  has_many :watch_parties, through: :movie_watch_parties

  # validates :name, presence: true
  # validates :email, presence: true
  validates_presence_of :name, :email, :password
  validates :email, uniqueness: true

  has_secure_password
end