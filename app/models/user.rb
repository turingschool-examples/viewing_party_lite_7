# frozen_string_literal: true

class User < ApplicationRecord
  has_many :viewing_parties
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  validates :name, :email, presence: true

  # @viewing_parties= []

  # def add_user_to_viewing_parties
  #   @viewing_parties << 
  # end
end
