class UpdatesController < ApplicationController
  def index
  end

  def create
    @update = Update.new update_params
    if @update.save
      @update.send_immediately ? redirect_to(admin_url, notice: "Your update has been sent out") : redirect_to(admin_url, notice: "You have saved a new update to send later")
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
