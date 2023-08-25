require 'rails_helper'

RSpec.describe ViewingParty, type: :model do

  describe 'relationships' do
    it { should have_many(:users).through(:user_viewing_parties) }
    it { should have_many(:user_viewing_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }
  end

  describe "#instance methods" do
    it "#find_host" do
      monet = User.create!(name: "Monet Xchange", email: "Monet_Xchange@hotmess.com")
      bob = User.create!(name: "Bob the Dragqueen", email: "Bobthehoe@hotmess.com")
      aquaria = User.create!(name: "Aquaria", email: "Aquariahoe@hotmess.com")
      party_1 = ViewingParty.create!(movie_id: 238, duration: 180, date: '2023-09-01', start_time: '12:00', movie_title: "The Godfather", movie_image: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")
      party_2 = ViewingParty.create!(movie_id: 278, duration: 600, date: '2023-09-01', start_time: '16:00', movie_title: "Shawshank Redemption", movie_image: "/lyQBXzOQSuE59IsHyhrp0qIiPAz.jpg")
      user_party_1 = UserViewingParty.create!(user_id: monet.id, viewing_party_id: party_1.id, host: true)
      user_party_2 = UserViewingParty.create!(user_id: bob.id, viewing_party_id: party_2.id)
      user_party_3 = UserViewingParty.create!(user_id: aquaria.id, viewing_party_id: party_2.id, host: true)

      expect(party_1.find_host).to eq(monet.name)
      expect(party_2.find_host).to eq(aquaria.name)
    end
  end
end