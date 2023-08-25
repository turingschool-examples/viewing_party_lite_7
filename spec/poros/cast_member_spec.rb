require 'rails_helper'

RSpec.describe CastMember do
  it 'has an actor/actress name and their character' do
    conrad = CastMember.new({
                              "adult": false,
                              "gender": 2,
                              "id": 3001,
                              "known_for_department": 'Acting',
                              "name": 'Conrad Veidt',
                              "original_name": 'Conrad Veidt',
                              "popularity": 3.786,
                              "profile_path": '/5PvSGqd3ZR9hjLE0Wo5yUPnKgPx.jpg',
                              "cast_id": 13,
                              "character": 'Cesare',
                              "credit_id": '52fe422ac3a36847f80090cb',
                              "order": 1
                            })

    expect(conrad.name).to eq('Conrad Veidt')
    expect(conrad.character).to eq('Cesare')
  end
end
