# frozen_string_literal: true

class UserViewingParty < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party

  validates :user_id, :viewing_party_id, presence: true
end
