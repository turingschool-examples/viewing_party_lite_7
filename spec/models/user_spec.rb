require 'rails_helper' 

RSpec.describe User, type: :model do
  describe 'relationships' do 
    it { should have_many(:viewing_party_users) }
    it { should have_many(:viewing_parties).through(:viewing_party_users) }
  end
  
  describe 'validations' do 
    it {should validate_uniqueness_of :email }
  end

  before(:each) do 
    user = create(:user)
    viewing_party = create(:viewing_party)
    viewing_party_user = create(:viewing_party_user, user: user, viewing_party: viewing_party)
    require 'pry'; binding.pry
  end
end
