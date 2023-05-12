# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  before_create :generate_random_id
  validates :duration, presence: true, numericality: true
  validates :date, presence: true
  validates :time, presence: true
  validates :movie_id, presence: true, numericality: true
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  private

  def generate_random_id
    self.id = SecureRandom.uuid
  end
end
