class ViewingParty < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  scope :hosted_by, ->(user) { where(user_id: user.id, is_host: true) }

  def guests
    User.joins(:viewing_parties)
        .where(viewing_parties: { movie_id: self.movie_id, is_host: false })
        .where.not(viewing_parties: { user_id: self.user_id })
  end
end
