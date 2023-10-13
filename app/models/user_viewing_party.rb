# frozen_string_literal: true

# app/models/user_viewing_party.rb
class UserViewingParty < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party

  # validates :host, presence: true, inclusion: [true, false]
  validates :host, inclusion: [true, false]
end
