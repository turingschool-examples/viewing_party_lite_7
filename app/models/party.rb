class Party < ApplicationRecord
  belongs_to :host, class_name: 'User', foreign_key: 'user_id'
  has_many :partygoings, dependent: :destroy
  has_many :users, through: :partygoings
  
  validates :movie_id, presence: true
  validates :title, presence: true
  validates :image_url, presence: true
  validates :datetime, presence: true
  validates :duration, presence: true
  validate :min_duration
  validate :min_date

  def invited_users
    users.where.not(id: user_id)
  end

  def host?(user)
    user_id == user.id
  end

  attr_accessor :movie_runtime

  private

  def min_duration
    if duration && duration < movie_runtime.to_i
      errors.add(:duration, "cannot be less than the movie's duration (#{movie_runtime} minutes)")
    end
  end

  def min_date
    if datetime && datetime < DateTime.now
      errors.add(:datetime, "cannot be sooner than today")
    end
  end
end