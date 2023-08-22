require "rails_helper"

RSpec.describe MovieGenre, type: :model do
  describe "relationships" do
    it { should belong_to :movie }
    it { should belong_to :genre }
  end
end