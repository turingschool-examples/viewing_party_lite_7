require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:vote_average) }
    it { should validate_presence_of(:runtime) }
    it { should validate_presence_of(:genres) }
    it { should validate_presence_of(:overview) }
    it { should validate_presence_of(:vote_count) }
  end

  describe 'relationships' do
    it { should have_many(:cast_members)}
    it { should have_many(:reviews)}
  end
end
