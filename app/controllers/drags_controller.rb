class DragsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show new]

  def new
  end

  def create
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
