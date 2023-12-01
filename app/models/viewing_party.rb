# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates :movie_id, :start_time, presence: true

  def initialize(viewing_party_params)
    @movie_id = viewing_party_params[:movie_id]
    @party_duration = viewing_party_params[:party_duration]
    @movie_title = viewing_party_params[:movie_title]
    @date = viewing_party_params[:date]
  end
end
