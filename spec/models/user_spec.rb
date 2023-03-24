# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :viewing_party_users }
  it { should have_many(:viewing_parties).through(:viewing_party_users) }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :name }
  # it { should validate :name, presence: true }

  context 'class methods' do
    describe '.other_users' do
      it 'returns the other users in the database' do
        @user = User.create!(name: 'Bob', email: 'bob@bob.bob')
        @user2 = User.create!(name: 'Bobby', email: 'bobby@rob.bob')
        @user3 = User.create!(name: 'Robbie', email: 'Robby@bobby.bob')

        expect(User.other_users(@user.id)).to eq([@user2, @user3])
        expect(User.other_users(@user.id)).to_not include(@user)
      end
    end
  end
end
