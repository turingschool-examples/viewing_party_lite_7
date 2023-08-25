require 'rails_helper'

RSpec.describe PartyGuest do
  describe 'validatons' do
    it { should validate_presence_of :host }
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :viewing_party }
  end
end
