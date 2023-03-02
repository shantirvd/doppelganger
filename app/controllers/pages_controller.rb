class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    #If user is not a drag
    @user_bookings = current_user.bookings

    @drag_bookings = current_user.drag&.bookings

  end

end
