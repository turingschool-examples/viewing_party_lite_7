class User < ApplicationRecord
  validates_presence_of :username, presence: true
  validates_presence_of :email, presence: true
end
