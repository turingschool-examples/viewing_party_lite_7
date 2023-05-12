require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe 'helper methods' do
    describe '#format_runtime(runtime)' do
      it 'formats a runtime in minutes to a string with hours and minutes' do
        expect(format_runtime(100)).to eq("1h 40m")
      end
    end

    describe '#format_genres(genres)' do
      it 'formats an array of genre strings to a single string seperated by commas' do
        genres = ['Comedy', 'Drama', 'Horror']
        expect(format_genres(genres)).to eq("Comedy, Drama, Horror")
      end
    end

    describe '#count_reviews(reviews)' do
      it 'counts the number of reviews hashes in a single reviews array' do
        reviews = [{a: "a"}, {b: "b"}, {c: "c"}]
        expect(count_reviews(reviews)).to eq(3)
      end
    end

    describe '#format_date(date)' do
      it 'formats a Date object to Month, Day Year format' do
        date = '2023-05-16'.to_date
        expect(format_date(date)).to eq('May 16, 2023')
      end
    end

    describe '#format_time(time)' do
      it 'formats a Time object to HH:MM AM or PM format' do
        time = '2000-01-01 13:46:00 UTC'.to_time
        expect(format_time(time)).to eq('1:46 PM')
      end
    end
  end
end
