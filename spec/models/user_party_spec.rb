require "rails_helper"

RSpec.describe UserParty, type: :model do
  before(:each) do
    load_test_data
  end

  describe '#relations' do
    it { should belong_to(:user) }
    it { should belong_to(:party) }
  end
end