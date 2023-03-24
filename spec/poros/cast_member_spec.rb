# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CastMember do
  it 'exists' do
    attrs = {
      name: 'Marlon Brando'
    }

    cast_member = CastMember.new(attrs)

    expect(cast_member).to be_a(CastMember)
    expect(cast_member.name).to eq('Marlon Brando')
  end
end
