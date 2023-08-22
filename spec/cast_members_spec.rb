require "rails_helper"

RSpec.describe CastMember, type: :model do
  describe "relationships" do
    it { should have_many :movie_cast_members }
    it { should have_many(:movies).through(:movie_cast_members) }
  end
end