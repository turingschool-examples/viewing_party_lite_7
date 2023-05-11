# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :viewing_party_users }
    it { should have_many(:users).through(:viewing_party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:user_id) }
  end

  describe 'class methods' do
    xit "::find_viewing_parties" do
      @user_1 = User.create!(name: 'John Doe', email: 'johndoe@yahoo.com')
      @user_2 = User.create!(name: 'Alex Smith', email: 'Asmith@yahoo.com')
      @user_3 = User.create!(name: 'Elvis Presley', email: 'kingofrock@yahoo.com')

      @viewing_party_1 = ViewingParty.create!(movie_id: 100, duration: 175, date: '2021-08-01', start_time: '2021-08-01 19:00:00 UTC', user_id: @user_1.id)
      @viewing_party_2 = ViewingParty.create!(movie_id: 202, duration: 145, date: '2020-06-11', start_time: '2021-06-011 14:00:00 UTC', user_id: @user_2.id)

      @viewing_party_user_1 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_1.id)
      @viewing_party_user_2 = ViewingPartyUser.create!(user_id: @user_2.id, viewing_party_id: @viewing_party_1.id)
      @viewing_party_user_3 = ViewingPartyUser.create!(user_id: @user_3.id, viewing_party_id: @viewing_party_1.id)
      @viewing_party_user_3 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_2.id)

      output = ViewingParty.hosted_viewing_parties(@user_1)
      output_2 = ViewingParty.find_viewing_parties(@user_2)

      expect(output).to eq([@viewing_party_1, @viewing_party_2])
      expect(output_2).to eq([@viewing_party_1])
    end
  end
  
end
