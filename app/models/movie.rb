class Movie < ApplicationRecord
  def self.runtime_in_min(data)
    runtime_minutes = data[:runtime].to_i
    hours = runtime_minutes / 60
    minutes = runtime_minutes % 60
    "#{hours} hours #{minutes} minutes"
  end
end