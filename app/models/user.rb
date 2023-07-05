class User < ApplicationRecord
  belongs_to :movie_watch_party, optional: true

  validates :name, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true

end