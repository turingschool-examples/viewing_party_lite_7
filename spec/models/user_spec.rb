require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many(:user_parties) }
    it { should have_many(:parties).through(:user_parties) }
  end

  describe "validations" do
    it { should validate_presence_of(:user_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

    it { should validate_presence_of(:password) }
    it { should have_secure_password }

  end

  describe "password bcrypt" do
    it "helps with lesson plan..." do
      user = User.create(user_name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123')

      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq('password123')
    end

  end

  describe "instance methods" do
    describe "#invitees" do
      it "returns all users except self" do
        user1 = User.create!(user_name: "Steve", email: "Steve@email.com", password: 'password123', password_confirmation: 'password123')
        user2 = User.create!(user_name: "Ben", email: "Ben@email.com", password: 'password345', password_confirmation: 'password345')
        user3 = User.create!(user_name: "Jane", email: "Jane@email.com", password: 'password567', password_confirmation: 'password567')

        expect(user1.invitees).to eq([user2, user3])
      end
    end
  end
end
