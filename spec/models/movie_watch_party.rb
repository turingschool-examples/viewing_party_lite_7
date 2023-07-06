require "rails_helper"

RSpec.describe MovieWatchParty, type: :model do
  describe "relationships" do
    describe "associations" do
      it { should belong_to :user }
      it { should define_enum_for(:user_status).with_values(attending: 0, hosting: 1)}
    end
  end
end