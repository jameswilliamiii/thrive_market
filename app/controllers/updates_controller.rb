class UpdatesController < ApplicationController
  def index
  end

  def create
    @update = Update.new update_params
    if @update.save
      redirect_to admin_url, notice: "Your update has been sent out"
    else
      render 'admin/index'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def update_params
    params.require(:update).permit(:content, :send_date, :send_immediately)
  end
end
