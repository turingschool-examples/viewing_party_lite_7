require "rails_helper"

describe "landing page" do
  it "will redirect to register if no users registered" do
    visit "/"

    expect(current_path).to eq(register_path)
  end
end