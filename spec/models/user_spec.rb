require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should allow_value('something@something.something').for(:email) }
    it { should_not allow_value('something somthing@something.something').for(:email) }
    it { should_not allow_value('something.something@').for(:email) }
    it { should_not allow_value('something').for(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }
  end

  describe 'associations' do
    it { should have_many :user_parties }
    it { should have_many(:parties).through(:user_parties) }
  end
  
  describe "registering a new user" do
    it "creates a user and ensure that the password and password confirmation are encrypted into the password digest" do 
        user = User.create(name: 'Tommy', email: 'tommy@test.com', password: 'password123', password_confirmation: 'password123')

      expect(user).to_not have_attribute(:password)
      expect(user).to_not have_attribute(:password_confirmation)
      expect(user.password_digest).to_not eq('password123')
    end
  end
end
