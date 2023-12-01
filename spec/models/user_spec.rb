require "rails_helper"

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many :user_parties }
    it { should have_many(:parties).through(:user_parties) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should allow_value('user@example.com').for(:email) }
  end

  describe '#self.other_users(exception)' do
    it 'will return the other users that are not the user placed in the exception' do
      new_spec_test_data
      user2 = User.create!(name: "Anthea", email: "anthea@website.com")
      user3 = User.create!(name: "Dog", email: "dog@website.com")
      expect(User.other_users(@user1)).to eq([user2,user3])
    end
  end
end