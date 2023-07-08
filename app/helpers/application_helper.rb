# # app/helpers/application_helper.rb
module ApplicationHelper

  def format_runtime(time)
    if time
      hours = time / 60
      minutes = time % 60
      "#{hours}hr #{minutes}min"
    else
      "no run time"
    end
  end
end
