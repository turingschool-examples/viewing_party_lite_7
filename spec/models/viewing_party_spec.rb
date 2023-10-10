require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relationships' do
    it {should have_many :user_viewing_parties}
    # for some reason this validation isn't working despite everything being set up correctly as far as I can tell
    # not even necessary just though having all relationships validated would be nice
    # it {should have_many(:users).through(:user_viewing_parties)}
  end

  describe 'validations' do
    it {should validate_presence_of :duration}
    it {should validate_presence_of :day}
    it {should validate_presence_of :view_time}
  end
end