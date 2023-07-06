class User < ApplicationRecord
  validates_presence_of :email,
                        :name

  validates :email, uniqueness: true
end
