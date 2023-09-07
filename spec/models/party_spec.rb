# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do
    it { should have_many(:party_users) }
    it { should have_many(:users).through(:party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:time) }
    it { should validate_numericality_of(:duration).only_integer }
    it { should validate_presence_of(:movie_id) }
  end

  describe 'instance methods' do
    before(:each) do
      @party = Party.create!(date: '2021-01-01', time: '12:00', duration: 120, movie_id: 59)
    end

    it 'can get the movie title', :vcr do
      expect(@party.movie_title).to eq("A History of Violence")
    end

    it 'can get the movie image', :vcr do
      expect(@party.get_image).to be_a(String)
    end
  end
end
