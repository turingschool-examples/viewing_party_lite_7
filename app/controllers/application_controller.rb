# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :error, :success

  private

  def error_message(errors)
    errors.full_messages.join(", ")
  end
end
