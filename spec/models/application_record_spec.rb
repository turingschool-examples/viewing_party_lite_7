# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationRecord, type: :model do
  describe '.date_formatter' do
    it 'formats dates' do
      arthur = ViewingParty.create!(movie_id: 49_012, duration: 140, date_time: '2023-04-27 14:54:09 UTC')

      expect(arthur.date_formatter(arthur.date_time)).to eq('Thursday, April 27, 2023')
    end
  end

  describe '.time_formatter' do
    it 'formats times' do
      arthur = ViewingParty.create!(movie_id: 49_012, duration: 140, date_time: '2023-04-27 14:54:09 UTC')

      expect(arthur.time_formatter(arthur.date_time)).to eq(' 2:54 PM')
    end
  end
end
