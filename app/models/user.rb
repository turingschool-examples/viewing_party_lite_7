class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add attribute, options[:message] || "'#{value}' is not a valid email"
    end
  end
end

class User < ApplicationRecord
  has_many :viewing_party_users
  has_many :viewing_parties, through: :viewing_party_users

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, email: true

  # placeholder method so that users/show_spec.rb test passes 
  # def viewing_parties
  #   []
  # end

  def name_email
    "#{name} (#{email})"
  end
end
