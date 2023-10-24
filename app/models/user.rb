# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  def parties_i_am_hosting
    viewing_parties.joins(:user_viewing_parties)
                   .where('user_viewing_parties.host = ? AND user_viewing_parties.user_id = ?', true, id)
                   .distinct
  end

  def parties_i_am_invited_to
    viewing_parties.joins(:user_viewing_parties)
                   .where('user_viewing_parties.host = ? AND user_viewing_parties.user_id = ?', false, id)
                   .distinct
  end
end
