require "rails_helper"

RSpec.describe "Movies Results Page" do
  before do
    create_list(:user, 1)
    @user = User.first

  end
  
  it "has a title", :vcr do
    visit user_movies_path(@user)
    expect(page).to have_content("Movies Results Page")
  end
end