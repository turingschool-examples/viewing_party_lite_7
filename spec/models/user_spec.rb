require "rails_helper"

RSpec.describe User do
  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
    it { should have_secure_password }
  end

  describe "relationships" do
    it { should have_many :viewing_users }
    it { should have_many(:viewing_parties).through(:viewing_users) }
  end

  describe "model updates" do
    it "checks to not have spassword_digest" do
      user = User.create(name: 'Boris', email: 'boris@hackermail.com', password: 'chair', password_confirmation: 'chair')
      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq('chair')
    end
  end
end