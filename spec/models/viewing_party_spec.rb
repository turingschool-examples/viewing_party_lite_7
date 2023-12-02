# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relationships' do
    it { should have_many(:users).through(:user_viewing_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:start_time) }
  end

  describe '#add_attendees' do
    it 'adds attendees to the viewing party' do
      user1 = create(:user)
      user2 = create(:user)
      viewing_party = create(:viewing_party)

      attendees = [user1.id, user2.id]

      viewing_party.add_attendees(attendees)

      expect(viewing_party.users).to include(user1, user2)
    end
  end
end
