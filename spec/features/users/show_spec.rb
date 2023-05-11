require 'rails_helper'

RSpec.describe 'users show page', type: :feature do
  before(:all) do
    @user1 = create(:user)
    @user2 = create(:user)

    @party1 = create(:party, host_user_id: @user1.id)
    
    visit user_path(@user1)
  end

  it 'displays the user dashboard header' do
  end

  it 'has a button linking to the user discover page' do
  end

  describe 'viewing party list' do
  end
end
