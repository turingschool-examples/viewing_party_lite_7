# frozen_string_literal: true

# app/controller/application_controller.rb
class ApplicationController < ActionController::Base
  def error_message(errors)
    errors.full_messages.join(', ')
  end
end
