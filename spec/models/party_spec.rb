require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do
    it { should have_many(:user_parties) }
    it { should have_many(:users).through(:user_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:movie_id) }
  end

  before(:each) do
  end

  describe '.create_with_checks' do
    let(:valid_params) do
      {
        duration: 120,
        date: Date.today,
        start_time: Time.now,
        movie_id: 1
      }
    end

    let(:invalid_params) do
      {
        duration: 240,
        date: Date.today,
        start_time: Time.now,
        movie_id: 1
      }
    end

    let(:host) { create(:user) }
    let(:valid_movie) { double('Movie', runtime: 150) }
    let(:invalid_movie) { double('Movie', runtime: 100) }

    it 'creates a party if movie runtime is greater than party duration' do
      success, party = described_class.create_with_checks(valid_params, host, valid_movie)

      expect(success).to be_truthy
      expect(party).to be_a(Party)
      expect(party).to be_persisted
    end

    it 'does not create a party if movie runtime is less than party duration' do
      success, party = described_class.create_with_checks(invalid_params, host, invalid_movie)

      expect(success).to be_falsey
      expect(party).to be_a(Party)
      expect(party).not_to be_persisted
    end
  end
end
