# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:party_users) }
    it { should have_many(:parties).through(:party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_digest)}
    it { should have_secure_password }
  end

  describe 'Secure password' do
    it 'has a password digest created' do
      user = User.create!(name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123')
      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq('password123')
    end
  end
  
  describe 'instance methods' do
    before(:each) do
      @user_1 = User.create!(name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123')
      @user_2 = User.create!(name: 'Jim', email: 'jim@test.com', password: 'password123', password_confirmation: 'password123')
      @user_3 = User.create!(name: 'Tim', email: 'tim@test.com', password: 'password123', password_confirmation: 'password123')

      @party_1 = Party.create!(duration: 1, date: Date.current, time: Time.current, movie_id: 5)
      @party_2 = Party.create!(duration: 1, date: Date.current, time: Time.current, movie_id: 25)

      PartyUser.create!(user_id: @user_1.id, party_id: @party_1.id, host: true)
      PartyUser.create!(user_id: @user_2.id, party_id: @party_1.id, host: false)
      PartyUser.create!(user_id: @user_3.id, party_id: @party_1.id, host: false)

      PartyUser.create!(user_id: @user_2.id, party_id: @party_2.id, host: true)
      PartyUser.create!(user_id: @user_1.id, party_id: @party_2.id, host: false)
    end

    it '#hosted_parties' do
      expect(@user_1.hosted_parties).to eq([@party_1])
      expect(@user_2.hosted_parties).to eq([@party_2])
      expect(@user_3.hosted_parties).to eq([])
    end

    it '#invited_parties' do
      expect(@user_1.invited_parties).to eq([@party_2])
      expect(@user_2.invited_parties).to eq([@party_1])
      expect(@user_3.invited_parties).to eq([@party_1])
    end
  end
end
