# frozen_string_literal: true

class PartyUser < ApplicationRecord
  belongs_to :user
  belongs_to :party

  validates :user_id, presence: true
  validates :party_id, presence: true
  validates :host, inclusion: [true, false]
end
