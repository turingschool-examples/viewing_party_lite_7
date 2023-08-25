require 'rails_helper'

RSpec.describe ViewingPartyUser, type: :model do
  describe 'validations' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :viewing_party_id }
    it { should validate_presence_of :hosting? }
  end
end
