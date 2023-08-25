require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'relationships' do
    it { should have_many :party_guests }
    it { should have_many(:viewing_parties).through(:party_guests) }
  end

  it 'can find all users besides the current logged in one' do
    @ally = User.create!(name: 'Ally Jean', email: 'allyjean@example.com')
    @jimmy = User.create!(name: 'Jimmy Jean', email: 'jimmyjean@example.com')
    @bobby = User.create!(name: 'Bobby Jean', email: 'bobbyjean@example.com')
    @dennis = User.create!(name: 'Dennis Jean', email: 'dennisjean@example.com')
    expect(@ally.friends).to match_array([@jimmy, @bobby, @dennis])
    expect(@jimmy.friends).to match_array([@ally, @bobby, @dennis])
    expect(@bobby.friends).to match_array([@jimmy, @ally, @dennis])
    expect(@dennis.friends).to match_array([@jimmy, @bobby, @ally])
  end
end
