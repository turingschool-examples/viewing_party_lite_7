# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should have_many :viewing_party_users }
    it { should have_many(:viewing_parties).through(:viewing_party_users) }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :name }
    it { should validate_presence_of :password }
    it { should have_secure_password }

    it 'should have a password digest that is not plain text' do
      user = User.create(
        name: 'Meg',  
        email: 'meg@test.com', 
        password: 'password123', 
        password_confirmation: 'password123'
      )
      
      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq('password123')
    end
  end

  context 'class methods' do
    describe '.other_users' do
      it 'returns the other users in the database' do
        @user = User.create!(
          name: 'Bob', 
          email: 'bob@bob.bob', 
          password: 'password123', 
          password_confirmation: 'password123'
        )
        @user2 = User.create!(
          name: 'Bobby', 
          email: 'bobby@rob.bob', 
          password: 'password123', 
          password_confirmation: 'password123'
        )
        @user3 = User.create!(
          name: 'Robbie', 
          email: 'Robby@bobby.bob', 
          password: 'password123', 
          password_confirmation: 'password123'
        )

        expect(User.other_users(@user.id)).to eq([@user2, @user3])
        expect(User.other_users(@user.id)).to_not include(@user)
      end
    end
  end
end
