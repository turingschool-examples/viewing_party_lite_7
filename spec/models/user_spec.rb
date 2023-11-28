require "rails_helper"

RSpec.describe User, type: :model do
  before(:each) do
    load_test_data
  end

  describe '#validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end