require "rails_helper" 

RSpec.describe UserViewingParty do 
  describe "validations" do 
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :viewing_party_id }
    it { should validate_numericality_of :user_id }
  end
end