require 'rails_helper'

RSpec.describe Cast do
  it 'exists' do
    attrs = {
      name: "Tom Cruise",
      character: "Ethan Hunt"
    }

    cast = Cast.new(attrs)

    expect(cast).to be_a(Cast)
    expect(cast.name).to eq("Tom Cruise")
    expect(cast.character).to eq("Ethan Hunt")
  end
end