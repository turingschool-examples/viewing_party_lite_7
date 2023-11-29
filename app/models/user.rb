class User < ApplicationRecord
  validates_presence_of :name,
                        :email
  
  validates :email, uniqueness: { case_sensitive: false }
  
end
