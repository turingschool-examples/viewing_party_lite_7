require 'rails_helper'

RSpec.describe DashboardFacade do
    context 'instance methods' do

        before(:each) do
            create_list(:user, 3)
            @user_1 = User.all[0]
            @user_2 = User.all[1]
            @user_3 = User.all[2]
            
            create_list(:viewing_party, 2, user: @user_1)
            create_list(:viewing_party, 3, user: @user_2)
            
            @viewing_party_1 = ViewingParty.all[0]
            @viewing_party_2 = ViewingParty.all[1]
            @viewing_party_3 = ViewingParty.all[2]
            @viewing_party_4 = ViewingParty.all[3]
            
            create_list(:viewing_party_user, 4, viewing_party: @viewing_party_1)
            create_list(:viewing_party_user, 6, viewing_party: @viewing_party_2)
            create_list(:viewing_party_user, 2, viewing_party: @viewing_party_3)
            create(:viewing_party_user, viewing_party: @viewing_party_3, user: @user_1)
            create(:viewing_party_user, viewing_party: @viewing_party_4, user: @user_1)
            create(:viewing_party_user, viewing_party: @viewing_party_3, user: @user_3)

        end

        it 'returns viewing parties the user has been invited to' do
            params = { id: @user_1.id } 

            @facade = DashboardFacade.new(params)
            expect(@facade.invited_parties).to eq([@viewing_party_3, @viewing_party_4])

            params = { id: @user_2.id } 

            @facade = DashboardFacade.new(params)
            expect(@facade.invited_parties).to eq([])

            params = { id: @user_3.id } 

            @facade = DashboardFacade.new(params)
            expect(@facade.invited_parties).to eq([@viewing_party_3])
        end

        
        it 'returns the viewing parties the user has created' do
            params = { id: @user_1.id } 

            @facade = DashboardFacade.new(params)
            expect(@facade.created_parties).to eq([@viewing_party_1, @viewing_party_2])

            params = { id: @user_2.id } 

            parties = @user_2.viewing_parties

            @facade = DashboardFacade.new(params)
            expect(@facade.created_parties).to eq(parties)

            params = { id: @user_3.id } 

            @facade = DashboardFacade.new(params)
            expect(@facade.created_parties).to eq([])
        end

        it 'loads an image url', :vcr do
            params = { id: @user_1.id } 

            @facade = DashboardFacade.new(params)
            
            party = @user_1.viewing_parties.create!(movie_id: 238, date: "Monday")

            expect(@facade.movie_image(party.movie_id)).to be_a(Image)
        end

        it 'grabs the movie title', :vcr do
            params = { id: @user_1.id } 

            @facade = DashboardFacade.new(params)
            
            party = @user_1.viewing_parties.create!(movie_id: 238, date: "Monday")
            
            expect(@facade.movie(party.movie_id).title).to eq("The Godfather")
        end
    end
end