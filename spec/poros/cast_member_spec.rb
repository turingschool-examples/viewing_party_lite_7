require 'rails_helper'

RSpec.describe CastMember do
  before(:each) do
    test_cast_member
    @cm = CastMember.new(@data)
  end
  describe "initialize" do
    it "exists and has attributes" do
      expect(@cm).to be_a CastMember
      expect(@cm.character).to eq("The Narrator")
      expect(@cm.actor).to eq("Edward Norton")
    end
  end
end
