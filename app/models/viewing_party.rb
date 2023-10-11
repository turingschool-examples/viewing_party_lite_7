class ViewingParty < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  scope :hosted_by, ->(user) { where(user_id: user.id, is_host: true) }
end
