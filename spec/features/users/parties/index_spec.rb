require 'rails_helper'

describe 'Dashboard: Discover Movies' do
  before :each do
    test_data
    visit user_path(@user1)
  end

  it "when visiting a user dashboard and clicking the Discover Movies Button, it redirects to the specific user's discover page" do
    click_button "Discover Movies"
    expect(current_path).to eq(user_discover_index_path(@user1))
  end
end