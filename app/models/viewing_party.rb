# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  has_many :users_viewing_parties
  has_many :users, through: :users_viewing_parties
end
