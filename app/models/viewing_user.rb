class ViewingUser < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party
  validates_presence_of :host

  enum host: [:NO, :YES]
end
