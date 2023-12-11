require "rails_helper"

RSpec.describe "New" do
  before :each do
    test_data 
  end

  it "can login" do
    visit "/login"

    fill_in :email, with: "Moogoo@gmail.com"
    fill_in :password, with: "Hello123!"

    click_on "Log In"
    expect(current_path).to eq("/users/#{@user3.id}")

  end
end