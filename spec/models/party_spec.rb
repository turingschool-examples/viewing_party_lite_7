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
    movie_details = {
      id: 238,
      vote_average: 8.200,
      original_title: "The Godfather",
      runtime: 175,
      genres: 'animation',
      overview: 'When an unconfident young woman is cursed with an old body by a spiteful witch',
      name: 'Takuya Kimura',
      character: 'Howl',
      total_results: 5,
      author: 'randoms',
      content: 'good stuff'
    }
    @user1 = User.create!(name: 'Joe', email: 'joe@gmail.com')
    @user2 = User.create!(name: 'Mama', email: 'mama@gmail.com')
    @movie1 = Movie.new(movie_details)
  end

  it 'creates a party if movie runtime is greater than party duration' do
    success, party = Party.create_with_checks({
      duration: 180,
      date: Date.today,
      start_time: "12:00",
      movie_id: 238
    }, @movie1)

    expect(success).to eq(true)
  end

  it 'doesnt create a party if movie runtime is greater than party duration' do
    success, party = Party.create_with_checks({
      duration: 150,
      date: Date.today,
      start_time: "12:00",
      movie_id: 238
    }, @movie1)

    expect(success).to eq(false)
  end
  
end
