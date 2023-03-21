require "rails_helper"

describe "when I visit the user dashboard page" do
  describe "i should see" do
    before :each do
      @user = create(:user)
      @vp1 = @user.viewing_parties.create!({duration: 120, date: Date.new(2011, 1, 1,), start_time: '21:00'})
      @vp2 = @user.viewing_parties.create!({duration: 103, date: Date.new(2011, 2, 1,), start_time: '21:00'})
      @vp3 = @user.viewing_parties.create!({duration: 90, date: Date.new(2011, 3, 1,), start_time: '21:00'})
      visit user_path(@user)
    end

    it "<user's name>'s Dashboard at the top of the page" do
      expect(page).to have_content("#{@user.name}'s Dashboard")
    end

    it "a button to discover movies" do
      expect(page).to have_button("Discover Movies")

      click_button "Discover Movies"

      expect(page).to have_current_path("/users/#{@user.id}/discover")
    end

    it "a section that lists viewing parties" do
      within "#viewing-parties" do
        expect(page).to have_content(@vp1.start_time)
        expect(page).to have_content(@vp2.start_time)
        expect(page).to have_content(@vp3.start_time)
      end
    end
  end
end