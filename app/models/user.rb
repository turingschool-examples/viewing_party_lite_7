class User < ApplicationRecord
  validates_presence_of :name, :email
  validates_presence_of :email, presence: true, uniqueness: true
end