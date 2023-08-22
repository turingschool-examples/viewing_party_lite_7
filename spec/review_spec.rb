require "rails_helper"

RSpec.describe Review, type: :model do
  describe "relationships" do
    it { should have_many :movie_reviews}
    it { should have_many(:movies).through(:movie_reviews) }
  end
end