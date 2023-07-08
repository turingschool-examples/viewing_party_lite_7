require 'rails_helper'

RSpec.describe ApplicationHelper do
  before(:each) do
    @date = Time.new(2023, 7, 8)
    @time = Time.new(2023, 7, 8)
    @runtime = 125
  end

  describe "instance_methods" do
    describe "#format_date" do
      it "returns a formatted date" do
        expect(format_date(@date)).to eq("July 08, 2023")
      end
    end

    describe "#format_time" do
      it "returns a formatted time" do
        expect(format_time(@time)).to eq("12:00 AM")
      end
    end

    describe "#format_runtime" do
      it "returns a formatted runtime" do
        expect(format_runtime(@runtime)).to eq("2h 5m")
      end
    end
  end
end