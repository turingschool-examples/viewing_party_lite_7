require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    it { should validate_presence_of :movie_id }
  end

  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end

  before(:each) do

    json_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: json_response, headers: {})

    @user_1 = create(:user)
    @movie_detail = Movie.new(JSON.parse(json_response, symbolize_names: true))
    @viewing_party_1 = ViewingParty.create!(duration: '180', host_id: @user_1.id, movie_id: @movie_detail.id,
                                            party_date: Date.today, party_time: '23:00')
    @viewing_party_user_1 = UserParty.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_1.id)
  end

  it 'retrieves all display data' do
    expect(@viewing_party_1.get_data).to match({ attendees: [@user_1],
                                                             date: Date.today,
                                                             duration: '180',
                                                             host: @user_1.name,
                                                             image: 'https://image.tmdb.org/t/p/w500//tmU7GeKVybMWFButWEGl2M4GeiP.jpg',
                                                             movie_id: 238,
                                                             time: Time.parse('2000-01-01 23:00:00.000000000 +0000'),
                                                             title: 'The Godfather' })
  end

end