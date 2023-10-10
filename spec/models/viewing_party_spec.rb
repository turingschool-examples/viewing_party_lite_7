require "rails_helper"

RSpec.describe ViewingParty, type: :model do
  it { should have_many(:users_viewing_parties) }
  it { should have_many(:users).through(:users_viewing_parties) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:movie_id) }
end