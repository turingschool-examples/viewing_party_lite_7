require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  before(:each) do
    user_test_data
  end

  describe 'validations' do
    it { should validate_presence_of(:day) }
    it { should validate_presence_of(:start_time) }
  end

  describe 'associations' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:users).through(:user_viewing_parties) }
  end

  describe 'instance methods' do
    it 'host_name' do
      expect(@viewing_party5.host_name).to eq(['Ink Jet Printer'])
      expect(@viewing_party1.host_name).to eq(['Maggie'])
    end

    it 'invitee_names' do
      expect(@viewing_party5.invitee_names).to match_array(%w[Maggie Max Wolfie])
      expect(@viewing_party5.invitee_names).to_not include(['Ink Jet Printer'])
    end

    it 'create_associations' do
      @viewing_party6.create_associations(@user1.id, [@user2.id, @user3.id, @user4.id])

      expect(@viewing_party6.user_viewing_parties.count).to eq(4)
      expect(@viewing_party6.host_name).to eq(['Maggie'])
      expect(@viewing_party6.invitee_names).to match_array(['Max', 'Wolfie', 'Ink Jet Printer'])
    end
  end
end
