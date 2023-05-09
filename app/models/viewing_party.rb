# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  validates :duration, presence: true, numericality: true
  validates :date, presence: true
  validates :time, presence: true
  validates :movie_id, presence: true, numericality: true
  belongs_to :user
end
