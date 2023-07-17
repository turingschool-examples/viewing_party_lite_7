require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :party_users }
    it { should have_many(:parties).through(:party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }
  end

  it "utilizes bcrypt for password encryption" do
    user = User.create(name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123')
    
    expect(user).to_not have_attribute(:password)
    expect(user.password_digest).to_not eq('password123')
  end
  
  describe 'instance methods' do
    describe '#hosted_parties' do
      it 'list parties that the user is hosting' do
        @user1 = User.create!(name: 'John Smith', email: 'jsmith@aol.com', password: 'password', password_confirmation: 'password')
        @user2 = User.create!(name: 'Emily Jones', email: '343ftl.com', password: 'password1', password_confirmation: 'password1')
        @user3 = User.create!(name: 'Jimmy johnson', email: 'jj33@aol.com', password: 'password3', password_confirmation: 'password3')

        @party1 = Party.create!(date: '2023-01-01', start_time: '08:00', duration: 275, movie_id: 238, host_id: @user1.id)
        @party2 = Party.create!(date: '2023-01-01', start_time: '08:00', duration: 275, movie_id: 238, host_id: @user2.id)
        @party_user1 = PartyUser.create!(user_id: @user1.id, party_id: @party1.id)
        @party_user2 = PartyUser.create!(user_id: @user2.id, party_id: @party1.id)
        @party_user3 = PartyUser.create!(user_id: @user3.id, party_id: @party1.id)
        @party_user4 = PartyUser.create!(user_id: @user1.id, party_id: @party2.id)
        @party_user5 = PartyUser.create!(user_id: @user2.id, party_id: @party2.id)

        expect(@user1.hosted_parties).to eq([@party1])
        expect(@user2.hosted_parties).to eq([@party2])
      end
    end

    describe '#invited_to_parties' do
      it 'list parties the the user is invited to' do
        @user1 = User.create!(name: 'John Smith', email: 'jsmith@aol.com', password: 'password', password_confirmation: 'password')
        @user2 = User.create!(name: 'Emily Jones', email: '343ftl.com', password: 'password1', password_confirmation: 'password1')
        @user3 = User.create!(name: 'Jimmy johnson', email: 'jj33@aol.com', password: 'password3', password_confirmation: 'password3')

        @party1 = Party.create!(date: '2023-01-01', start_time: '08:00', duration: 275, movie_id: 238, host_id: @user1.id)
        @party2 = Party.create!(date: '2023-01-01', start_time: '08:00', duration: 275, movie_id: 238, host_id: @user2.id)
        @party_user1 = PartyUser.create!(user_id: @user1.id, party_id: @party1.id)
        @party_user2 = PartyUser.create!(user_id: @user2.id, party_id: @party1.id)
        @party_user3 = PartyUser.create!(user_id: @user3.id, party_id: @party1.id)
        @party_user4 = PartyUser.create!(user_id: @user1.id, party_id: @party2.id)
        @party_user5 = PartyUser.create!(user_id: @user2.id, party_id: @party2.id)

        expect(@user1.invited_to_parties).to eq([@party2])
        expect(@user2.invited_to_parties).to eq([@party1])
        expect(@user3.invited_to_parties).to eq([@party1])
      end
    end
  end
end
