require "rails_helper"

RSpec.describe "New Viewing Party Page" do
  before :each do 
    @user1 = User.create!(name: "Haley M", email: "haley@haley.com")
    @user2 = User.create!(name: "Camila T", email: "camila@camila.com")
    @user3 = User.create!(name: "Rachel V", email: "rachel@rachel.com")
    @user4 = User.create!(name: "Bret M", email: "bret@bret.com")

  end
  
  describe 'the new viewing party form' do
    it 'has all the proper fields to create a new viewing party' do

      stub_request(:get, "https://api.themoviedb.org/3/movie/3214?api_key=#{Rails.application.credentials.api_key}&movie_id=3214").
        to_return(status: 200, body: File.read("spec/features/fixtures/movie_details.json"), headers: {})
      visit user_movie_path(user_id: @user1.id, id: 3214)

      expect(page).to have_link('Create a Viewing Party')
      click_link 'Create a Viewing Party' 
      expect(current_path).to eq new_user_movie_viewing_party_path(user_id: @user1.id, id: 3214)

      within("#movie_details") do 
        expect(page).to have_content("Movie Title: Santo")
      end

      within(".new_party") do 
        expect(page).to have_field('Duration', with: "95 minutes")
        expect(page).to have_field :start_time
        expect(page).to have_unchecked_field :users

      end
    end
  end
end

# @invoice_items1 = InvoiceItem.create!(quantity: 10, unit_price: 10, status: "pending", item: @item2, invoice: @invoice_1 )
