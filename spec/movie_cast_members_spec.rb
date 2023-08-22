require "rails_helper"

RSpec.describe MovieCastMember, type: :model do
  describe "relationships" do
    it { should belong_to :movie }
    it { should belong_to :cast_member }
  end
end