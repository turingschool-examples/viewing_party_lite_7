require "rails_helper"

RSpec.describe "New viewing party page" do
  before(:each) do
    @user1 = User.create!(name: "Flick Chick", email: "flick@yahoo.com")
    @user2 = User.create!(name: "Rom Com Ron", email: "comron@yahoo.com")
    @user3 = User.create!(name: "Action Jackson", email: "itsjack@aol.com")
  end

  it "movie title should be above viewing party form" do
    visit "/users/#{@user3.id}/movies/238/viewing_party"

    expect("The Godfather").to appear_before("Duration")
    # expect(page).to have_field(:when)
    # fill_in(:when, :with =>)

  end
end

