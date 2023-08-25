# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PartyUser, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:party) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:party_id) }
    it { should allow_value(true).for(:host) }
    it { should allow_value(false).for(:host) }
    it { should_not allow_value(nil).for(:host) }
  end
end
