# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PartyUser, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:party) }
  end

  describe 'validations' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :party_id }
    it {
      should validate_inclusion_of(:is_host).in_array([true, false])
    } # shoulda-matchers actually warns this is unnecessary, but it does pass of course
  end
end
