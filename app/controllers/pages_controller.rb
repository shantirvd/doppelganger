class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @bookings = current_user.bookings
    # @drag_bookings = current_user.drag.bookings
  end
end
