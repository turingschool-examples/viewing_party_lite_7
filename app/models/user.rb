class User < ApplicationRecord
  validates_presence_of :name, presence: true
  validates_presence_of :email, presence: true
end
