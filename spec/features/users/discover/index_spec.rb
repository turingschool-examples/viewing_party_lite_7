require 'rails_helper'

RSpec.describe 'Discover Movies Page' do
    describe 'When I visit the user discover page' do
        before :each do
            @user1 = User.create(name: 'Joe', email: 'joeiscool@yahoo.com')

            visit user_discover_index_path(@user1)
        end

        it 'has a button to discover top rated movies' do
            expect(page).to have_button('Discover Top Rated Movies')
        end
    end
end