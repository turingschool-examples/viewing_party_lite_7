require "rails_helper"
RSpec.describe ViewingParty, type: :model do
  describe "relationships" do
    it {should belong_to :user}
    it {should belong_to :viewing_party}
  end
end