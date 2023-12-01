require "rails_helper"

RSpec.describe "New Viewing Party Page" do
  before do
    VCR.use_cassette("godfather-movie-details") do
      @user1 = User.create(name: "TP", email: "tp@gmail.com")
      @user2 = User.create(name: "Charles", email: "charles@gmail.com")
      @user3 = User.create(name: "Chris", email: "chris@gmail.com")

      @movie = MovieFacade.new(238).add_details # God Father ID

      visit "/users/#{@user1.id}/movies/#{@movie.id}/viewing_parties/new"
    end
  end

  describe "new viewing party form" do
    it "displays the movie title above a form" do
      expect(page).to have_content(@movie.title)
    end

    it "has a 'Duration of Party' field prefilled with the movie's runtime in minutes" do
      expect(page).to have_field("Duration of Party")
    end

    it "has date and time selection fields" do
    end

    it "has individual checkboxes to invite every other existing user" do
      expect(page).to have_unchecked_field("#{@user2.name} (#{@user2.email})")
      expect(page).to have_unchecked_field("#{@user3.name} (#{@user3.email})")

      expect(page).to_not have_checked_field("#{@user1.name} (#{@user1.email})")
    end

    it "has a button to create a party" do
      expect(page).to have_button("Create Party").once
    end
  end

  describe "happy path" do
    it "redirects to the user's dashboard where the new event is shown" do
      check(@user2.name_email)
      click_button("Create Party")

      expect(current_path).to eq(user_path(@user1.id))
      expect(page).to have_content(@movie.title)

      visit user_path(@user2.id)
      expect(page).to have_content(@movie.title)
    end
  end
end
