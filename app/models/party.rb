class Party < ApplcationRecord
  validates :movie_id, presence: true
  validates :movie_title, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :start_timetime, presence: true

  has_many :user_parties
  has_many :users, through: :user_parties
end