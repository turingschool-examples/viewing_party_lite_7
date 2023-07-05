# app/helpers/application_helper.rb
module ApplicationHelper
  def flash_message
    flash.map do |type, message|
      content_tag :div, message, class: "alert #{flash_class(type)}"
    end.join.html_safe
  end

  def flash_class(type)
    case type.to_sym
    when :error
      'alert-error'
    end
  end
end
