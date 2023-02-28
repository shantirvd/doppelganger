class DragsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def new
    @drag = Drag.new
    # skip_authorization
    authorize @drag
  end

  def create
    @drag = Drag.new(params_drag)
    @drag.user = current_user
    authorize @drag
    if @drag.save
      redirect_to drag_path(@drag)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def params_drag
    params.require(:drag).permit(:nickname, :city, :radius, :description, :specialty, :hourly_rate, :photos)
  end
end
