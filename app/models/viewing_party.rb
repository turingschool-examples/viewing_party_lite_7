# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  validates :host_id, :duration, :day, :time, :movie_id, presence: true

  belongs_to :movie
  has_many :party_users
end
