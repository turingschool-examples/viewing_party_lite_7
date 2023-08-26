# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relationships' do
    it { should have_many(:users_viewing_parties) }
    it { should have_many(:users).through(:users_viewing_parties) }
  end
end
