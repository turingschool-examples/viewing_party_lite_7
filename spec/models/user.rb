require "rails_helper"

RSpec.describe User, type: :model do
  describe "relationships" do
    describe "associations" do
      it { should have_many :movie_watch_parties }
      it { should have_many(:movies).through(:movie_watch_parties) }
    end

    describe "validations" do

    end
  end
end