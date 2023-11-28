# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  belongs_to :user
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates :user_id, :start_time, presence: true
end
