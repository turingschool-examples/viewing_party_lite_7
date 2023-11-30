require "rails_helper"

RSpec.describe Utility, type: :model do
  describe "#runtime_in_min" do
    it "can return runtime in hourse and minutes" do
      data = { runtime: "126" }
      expect(Utility.runtime_in_min(data)).to eq("2 hours 6 minutes")
    end
  end
end