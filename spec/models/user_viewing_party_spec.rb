# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserViewingParty, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:viewing_party) }
  end

  describe "validations" do
    it "can is only valid if host is truthy/falsey" do
      load_test_data

      expect(UserViewingParty.create(host: true, user: @anne, viewing_party: @arthur )).to be_valid
      expect(UserViewingParty.create(host: false, user: @anne, viewing_party: @arthur )).to be_valid
      expect(UserViewingParty.create(host: nil, user: @anne, viewing_party: @arthur )).to be_invalid
    end
  end
end
