require 'rails_helper'

describe "When I visit the new viewing party page (/users/:user_id/movies/:movid_id/viewing-party/new, where :user_id is a valid user's id)" do
  before :each do
    @user = create(:user)
    @user2 = create(:user)
    @user3= create(:user)
    @user4 = create(:user)
    @user5 = create(:user)
    @user6 = create(:user)
    @user7 = create(:user)
    @user8 = create(:user)

    
    VCR.use_cassette('viewing_party_2') do
      facade = MovieFacade.new({id: 238, user_id: @user.id})
      @movie = facade.movie
      visit new_user_movie_viewing_party_path(@user, @movie.id)
    end
  end

  describe 'form' do
    it 'has a field for duration of party with a default value of movie runtime in minutes' do
      expect(page).to have_field("viewing_party[duration]", with: @movie.runtime)
    end

    it "has a field to select the date" do
      expect(page).to have_field('viewing_party[date(1i)]')
      expect(page).to have_field('viewing_party[date(2i)]')
      expect(page).to have_field('viewing_party[date(3i)]')
    end

    it "has a field to select the start time" do
      expect(page).to have_field('viewing_party[start_time(4i)]')
      expect(page).to have_field('viewing_party[start_time(5i)]')
    end

    it "has checkboxes next to each existing user in the system" do
      save_and_open_page
      expect(page).to have_unchecked_field(@user)
      expect(page).to have_unchecked_field(@user2)
      expect(page).to have_unchecked_field(@user3)
      expect(page).to have_unchecked_field(@user4)
      expect(page).to have_unchecked_field(@user5)
      expect(page).to have_unchecked_field(@user6)
      expect(page).to have_unchecked_field(@user7)
      expect(page).to have_unchecked_field(@user8)
    end

    it "has a button to create a party" do
      expect(page).to have_button("Create Viewing Party")

    end

  end

  describe 'details' do
    it "reroutes the user back to their dashboard where the party is shown after the create" do
      fill_in 'date_select', with: Date.today + 1
      fill_in 'start_time_select', with: '20:15'
      check @user2
      check @user4
      check @user7
      check @user8

      click_button 'Create Viewing Party'

      expect(page).to have_current_path(user_path(@user))
      expect(page).to have_content('The Godfather Viewing Party on March 25th, 2023')
    end

    it 'will validate that the viewing party length is greater than or equal to the duration of the movie' do
      fill_in 'Duration', with: '120'
      fill_in 'date_select', with: Date.today + 1
      fill_in 'start_time_select', with: '20:15'
      check @user2
      check @user4
      check @user7
      check @user8

      click_button 'Create Viewing Party'

      expect(page).to have_current_path(new_user_movie_viewing_party_path(@user, @movie))
      expect(page).to have_content('Must be greater than or equal to movie runtime in minutes: 175')
    end

    
      
    it "is listed in other user's dashboards that were invited to the party" do
      fill_in 'date_select', with: Date.today + 1
      fill_in 'start_time_select', with: '20:15'
      check @user2
      check @user4
      check @user7
      check @user8

      click_button 'Create Viewing Party'

      expect(page).to have_current_path(user_path(@user))  

      visit user_path(@user_2)

      expect(page).to have_content('The Godfather Viewing Party on March 25th, 2023')
    end
  end
end
