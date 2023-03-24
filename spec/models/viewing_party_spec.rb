# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  it { should have_many :viewing_party_users }
  it { should have_many(:users).through(:viewing_party_users) }

  it { should validate_numericality_of :duration }
  it { should validate_presence_of :duration }
  it { should validate_presence_of :movie_id }
  it { should validate_presence_of :date }
  it { should validate_presence_of :time }
end
