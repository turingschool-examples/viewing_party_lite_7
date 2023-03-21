require "rails_helper"

RSpec.describe ViewingParty do 
  describe "relationships" do 
    it {should have_many :users}
    it {should have_many(:users).through(:viewing_party_users)}
  end
end