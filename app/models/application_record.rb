class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def date_formatter
    date_time.strftime("%A, %B %d, %Y")
  end

  def time_formatter
    date_time.strftime("%l:%M %p")
  end
end
