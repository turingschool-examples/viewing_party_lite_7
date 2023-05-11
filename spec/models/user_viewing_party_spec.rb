require 'rails_helper'

RSpec.describe UserViewingParty, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:viewing_party) }
  end

  describe 'validations' do
    it { should define_enum_for(:user_type) }
  end
end
