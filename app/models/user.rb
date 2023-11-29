# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end
