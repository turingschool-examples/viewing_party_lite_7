class Party < ApplicationRecord
  belongs_to :host, class_name: 'User', foreign_key: 'user_id'
  has_many :partygoings, dependent: :destroy
  has_many :users, through: :partygoings
  

  validates :title, presence: true
  validates :datetime, presence: true
  validates :duration, presence: true
  validate :min_duration

  attr_accessor :movie_runtime

  private

  def min_duration
    if duration && duration < movie_runtime.to_i
      errors.add(:duration, "cannot be less than the movie's duration (#{movie_runtime} minutes)")
    end
  end
end