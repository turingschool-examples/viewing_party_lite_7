require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it { should have_many(:viewing_parties) }
  end

  describe 'validations' do 
    it { should validate_presence_of (:title) }
    it { should validate_presence_of (:vote_average) }
    it { should validate_presence_of (:runtime) }
    it { should validate_presence_of (:genre) }
    it { should validate_presence_of (:description) }
    it { should validate_presence_of (:cast_members) }
    it { should validate_presence_of (:review_count) }
    it { should validate_presence_of (:review_info) }
  end
end
