# frozen_string_literal: true

module Users
  module Movies
    class PartiesController < ApplicationController
      def new
        @user = params[:user_id]
        @movie = params[:movie_id]
      end
    end
  end
end
