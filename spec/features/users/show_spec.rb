require "rails_helper"

RSpec.describe "user dashboard page", type: :feature do
  before(:each) do
    @user1 = User.create!(
      name: "John",
      email: "john@example.com",
      password: "abc123",
      password_confirmation: "abc123"
    )
    @user2 = User.create!(
      name: "Myles",
      email: "myles@example.com",
      password: "random",
      password_confirmation: "random"
    )
    @user3 = User.create!(
      name: "Boston",
      email: "boston@example.com",
      password: "foobar",
      password_confirmation: "foobar"
    )
  end

  describe "when I visit a user's dashboard" do
    context "when I am logged in as a user" do
      describe "User 1" do
        before(:each) do
          visit "/login"

          fill_in :email, with: @user1.email
          fill_in :password, with: @user1.password
          click_button "Log In"

          visit user_path(@user1)
        end

        it "displays a link to the home page and 'Viewing Party' at the top of the page" do
          expect(page).to have_link("Home")
          expect(page).to have_content("Viewing Party")
        end

        it "displays '<user's name>'s Dashboard' after 'Viewing Party" do
          within("#title") do
            expect(page).to have_content("#{@user1.name}'s Dashboard")
          end
        end

        it "displays a button that links to 'Discover Movies'" do
          expect(page).to have_button("Discover Movies")

          click_button "Discover Movies"

          expect(current_path).to eq(user_discover_index_path(@user1.id))
        end
      end

      describe "User 2" do
        before(:each) do
          visit "/login"

          fill_in :email, with: @user2.email
          fill_in :password, with: @user2.password
          click_button "Log In"

          visit user_path(@user1)
          visit user_path(@user2)
        end

        it "displays '<user's name>'s Dashboard' after 'Viewing Party" do
          within("#title") do
            expect(page).to have_content("#{@user2.name}'s Dashboard")
          end
        end

        it "displays a button to 'Discover Movies'" do
          expect(page).to have_button("Discover Movies")

          click_button "Discover Movies"

          expect(current_path).to eq(user_discover_index_path(@user2.id))
        end
      end
    end

    context "when I am not logged in as a user" do
      it "redirects me to the home page and displays a flash message" do
        visit user_path(@user1)

        expect(current_path).to eq("/")

        expect(page).to have_content("Sorry, you must be logged in or registered to access your dashboard.")
      end
    end
  end
end
