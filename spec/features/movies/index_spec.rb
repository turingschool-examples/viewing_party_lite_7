require "rails_helper"

RSpec.describe "Movies Results Page" do
  before do
    create_list(:user, 1)
    @user = User.first

    visit user_movies_path(@user)
  end

  it "has a title" do
    expect(page).to have_content("Movies Results Page")
  end
end