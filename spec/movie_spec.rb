require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it { should have_many :movie_cast_members}
    it { should have_many :movie_genres}
    it { should have_many :movie_reviews}
    it { should have_many(:cast_members).through(:movie_cast_members) }
    it { should have_many(:genres).through(:movie_genres) }
    it { should have_many(:reviews).through(:movie_reviews) }
  end
end