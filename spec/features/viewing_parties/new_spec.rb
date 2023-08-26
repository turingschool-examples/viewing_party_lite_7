require "rails_helper"

RSpec.describe "New Viewing Party Page" do
  before(:each) do
    # params = { id: 238 }
    # facade = ShowFacade.new(params)
    # @movie = facade.movie

    create_list(:user, 4)
    @user_1 = User.all[0]
    @user_2 = User.all[1]
    @user_3 = User.all[2]
    @user_4 = User.all[3]

    visit new_user_movie_viewing_party_path(@user_1.id, 238)
  end

  it "displays the movie title at the top of the page", :vcr do
    save_and_open_page
    expect(page).to have_content("The Godfather")
  end

  describe "creation form" do
    describe "duration field" do
      it "defaults to the runtime of the movie", :vcr do
        expect(page).to have_field("Duration", with: "175")
      end

      xit "can be set to longer than the movie runtime", :vcr do
        fill_in "Duration", with: "200"
        fill_in "Date", with: "2023/09/01"
        fill_in "Time", with: "19:00:00"

        within(first(".user")) do
          check "#{@user_2.name}"
        end

        click_button "Create Party"

        expect(path).to eq(user_path(@user_1))
      end

      xit "cannot be set to shorter than the movie runtime", :vcr do
        fill_in "Duration", with: "120"
        fill_in "Date", with: "2023/09/01"
        fill_in "Time", with: "19:00:00"

        within "#{@user_2.id}" do
          check "#{@user_2.name}"
          
        end

        within "#{@user_4.id}" do
          check "#{@user_4.name}"
        end

        click_button "Create Party"

        expect(page).to have_content("Please complete all fields.")
      end
    end
  end

    xit "has fields to select date and time", :vcr do
      expect(page).to have_field("date")
      expect(page).to have_field("time")
    end

    xit "has checkboxes next to each existing user in the system", :vcr do

    end

    xit "has a button to create the party", :vcr do
  end

  describe "viewing party creation" do
    describe "happy path" do
      xit "redirects to the user dashboard where the new event is shown", :vcr do

      end
    end

    describe "sad path" do
      xit "renders the form again and displays a flash message", :vcr do

      end
    end
  end

  describe "viewing party user creation" do
    xit "creates a new viewing party user for each user selected on form", :vcr do

    end

    xit "displays the new event on all invitee's dashboards", :vcr do

    end
  end
end

