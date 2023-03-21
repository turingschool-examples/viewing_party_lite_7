require 'rails_helper'

RSpec.describe ViewingPartyUser, type: :model do
  it { should belong_to :user }
  it { should belong_to :viewing_party }
  it { should validate_presence_of :host }
  
end