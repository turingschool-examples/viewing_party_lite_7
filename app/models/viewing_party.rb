# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  belongs_to :user
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true
  validates :movie_id, presence: true
  validates :user_id, presence: true
end
