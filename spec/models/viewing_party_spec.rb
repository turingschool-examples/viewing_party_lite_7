require 'rails_helper'

RSpec.describe ViewingParty do
  describe 'validations' do
    it { should validate_presence_of(:host) }
    it { should validate_presence_of(:movie) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:guests) }
  end
end
