require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
  before(:each) do
    visit user_dashboard_path(@user1)
  end

  it 'has a header' do
    save_and_open_page
    expect(page).to have_content("#{@user1.name}'s Dashboard")
    expect(page).to have_button('Discover Movies')
  end
end
