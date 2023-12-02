require "rails_helper"

describe "Users Index Page" do
  before :each do
    test_data
    visit users_path
  end

  it "has all users listed" do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user1.email)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user2.email)
    expect(page).to have_content(@user3.name)
    expect(page).to have_content(@user3.email)
  end
end