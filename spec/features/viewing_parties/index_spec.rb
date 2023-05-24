require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
  user = create(:user)
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path
  end

  it 'has a header' do
    expect(page).to have_content("#{user.name}'s Dashboard")
    expect(page).to have_button('Discover Movies')
  end
end
