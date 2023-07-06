require 'rails_helper'

RSpec.describe 'Discover Movies Page', type: :feature do 
  before(:each) do 
    @user_1 = create(:user)
    @user_2 = create(:user)
    visit user_path(@user_1)
  end

  describe 'Discover Movies Button' do 
    it "button to discover movies routes to user discover page" do 
      click_on 'Discover Movies'
      expect(current_path).to eq(user_discover_index_path(@user_1))
      expect(current_path).to eq("/users/#{@user_1.id}/discover")
    end

    it 'button to discover movies sad path' do 
      click_on 'Discover Movies'
      expect(current_path).to_not eq(user_discover_index_path(@user_2))
      expect(current_path).to_not eq("/users/#{@user_2.id}/discover")
    end
  end
end