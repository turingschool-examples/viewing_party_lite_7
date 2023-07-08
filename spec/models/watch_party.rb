require "rails_helper"

RSpec.describe WatchParty, type: :model do
  describe "relationships" do
    describe "associations" do

      it { should have_many :movie_watch_parties }
      it { should have_many(:users).through(:movie_watch_parties) }
    end
  end
  
end
