require "rails_helper"

RSpec.describe MovieReview, type: :model do
  describe "relationships" do
    it { should belong_to :movie }
    it { should belong_to :review }
  end
end