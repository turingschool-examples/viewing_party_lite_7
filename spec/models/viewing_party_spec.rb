require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relationships' do
    it { should have_many(:viewing_party_users) }
    it { should have_many(:users).through(:viewing_party_users) }
    it { should belong_to(:user) }
  end
  describe 'instance methods' do
    let!(:user_1) { create(:user) }
    let!(:user_2) { create(:user) }
    let!(:user_3) { create(:user) }

    let!(:vp_1) { create(:viewing_party, user_id: user_1.id, movie: 1864) }
    let!(:vp_2) { create(:viewing_party, user_id: user_1.id, movie: 1999) }
    let!(:vp_3) { create(:viewing_party, user_id: user_2.id, movie: 1985) }
    
    it '#other_users' do
    vpu_1 = ViewingPartyUser.create(user_id: user_2.id, viewing_party_id: vp_1.id)
    vpu_2 = ViewingPartyUser.create(user_id: user_3.id, viewing_party_id: vp_1.id)

    vpu_3 = ViewingPartyUser.create(user_id: user_2.id, viewing_party_id: vp_2.id)
    vpu_4 = ViewingPartyUser.create(user_id: user_3.id, viewing_party_id: vp_2.id)

    vpu_5 = ViewingPartyUser.create(user_id: user_1.id, viewing_party_id: vp_3.id)
    vpu_6 = ViewingPartyUser.create(user_id: user_3.id, viewing_party_id: vp_3.id)

    expect(vp_1.other_users).to eq([user_2.name, user_3.name])
    end
  end
end
