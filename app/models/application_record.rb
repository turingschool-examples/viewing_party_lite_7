# frozen_string_literal: true

# app/models/application_record.rb
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def date_formatter(datetime)
    datetime.strftime('%A, %B %d, %Y')
  end

  def time_formatter(datetime)
    datetime.strftime('%l:%M %p')
  end
end
