class UpdatesController < ApplicationController

  def create
    @update = Update.new update_params
    if @update.save
      redirect_to admin_url, notice: "Your update has been sent out"
    else
      render 'admin/index'
    end
  end

  def destroy
    @update = Update.find params[:id]
    @update.destroy
    redirect_to admin_updates_url, notice: "Update has been deleted"
  end

  private

  def update_params
    params.require(:update).permit(:content, :send_date, :send_immediately)
  end
end
