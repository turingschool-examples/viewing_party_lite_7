require 'rails_helper'

RSpec.describe 'User Movies Page' do
    before :each do
        @user1 = User.create(name: 'Joe', email: 'joeiscool@yahoo.com')
    end

    describe 'Top Rated Movie Results Page' do
        scenario 'click Discover Top Rated Movies button', :vcr do
            visit user_discover_index_path(@user1)
            click_link 'Discover Top Rated Movies'

            expect(current_path).to eq(user_movies_path(@user1))
            expect(page).to have_content('Movie Results')

        end
    end

    it 'has a Discover Page button', :vcr do
        visit user_movies_path(@user1)

        expect(page).to have_button('Discover Page')

        click_button 'Discover Page'

        expect(current_path).to eq(user_discover_index_path(@user1))
    end
end