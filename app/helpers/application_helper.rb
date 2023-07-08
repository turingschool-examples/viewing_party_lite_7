# frozen_string_literal: true

module ApplicationHelper
  def format_date(date)
    date.strftime("%B %d, %Y")
  end

  def format_time(time)
    time.strftime("%l:%M %p").strip
  end

  def format_runtime(runtime)
    hours = runtime.div(60)
    minutes = runtime % 60
    "#{hours}h #{minutes}m"
  end
end
