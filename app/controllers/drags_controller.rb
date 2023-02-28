class DragsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def new
    @drag = Drag.new
    # skip_authorization
    authorize @drag
  end

  def create
    # @drag = Drag.new(params_drag)

    # if @drag.save
    #   redirect_to drag_path(@drag)
    # else
    #   render :new
    # end
  end

  def index
    @drags = Drag.all
    @drags = policy_scope(Drag)
  end

  def show
    raise
    @drag = Drag.find(params[:id])
    authorize @drag
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
