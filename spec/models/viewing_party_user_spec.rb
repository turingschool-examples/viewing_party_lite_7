require 'rails_helper'

RSpec.describe ViewingPartyUser do

    describe 'validations' do
        it { should validate_presence_of(:user_id) }
        it { should validate_presence_of(:viewing_party_id) }
        it { should validate_presence_of(:status) }
    end
    describe 'relationships' do
        it { should belong_to(:viewing_party) }
        it { should belong_to(:user) }
    end
end