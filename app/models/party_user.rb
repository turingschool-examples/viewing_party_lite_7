# frozen_string_literal: true

class PartyUser < ApplicationRecord
  belongs_to :party
  belongs_to :user

  validates :user_id, presence: true
  validates :party_id, presence: true
  validates :is_host, inclusion: [true, false]
end
