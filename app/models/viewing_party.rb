class ViewingParty < ApplicationRecord
  belongs_to :user
  validates :movie_id, presence: true
  validates :duration, presence: true, numericality: true, comparison: { greater_than_or_equal_to: :movie_duration}
  validates :party_date, presence: true, timeliness: { on_or_after: Date.today, type: :date }
  validates :start_time, presence: true, timeliness: { at_or_after: Time.now, type: :time}

  def movie_duration
    MoviesService.new.find_movie(self.movie_id).runtime
  end
end